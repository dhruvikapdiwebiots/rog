import 'package:intl/intl.dart';
import 'package:rog/networking/index.dart';
import 'package:rog/packages/config_package.dart';
import 'package:rog/utils/commonController.dart';
import 'package:rog/utils/helper.dart';

class CameraCardController extends GetxController {
  String name = '';
  String groupname = '';
  String time = '';
  String date = '';
  String camera_uuid = '';
  String camera_groups_uuid = '';

  @override
  void onInit() {
    // TODO: implement onInit

    getStorageVal();
    getCameraViewData();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    var data = Get.arguments;
    name = data['cameraName'];
    groupname = data['groupName'];

    update();
    print('name : $name');
    print('groupName : $groupname');
    super.onReady();
  }

  var data;
  bool isLoading = false;


  //getStorage value
  getStorageVal() async {
    var data = Get.arguments;
    String cameraGroupId = await Helper().getStorage('camera_groups_uuid');
    String cameraID = await Helper().getStorage('camera_uuid');
    String cameraGroupName = await Helper().getStorage('cameraName');
    String cameraNameStorage = await Helper().getStorage('groupName');

    if (cameraGroupId != null && cameraGroupId != "") {
      camera_groups_uuid = cameraGroupId;
    } else {
      camera_groups_uuid = data['camera_groups_uuid'];
    }

    if (cameraID != null && cameraID != "") {
      camera_uuid = cameraID;
    } else {
      camera_uuid = data['camera_uuid'];
    }

    if (cameraGroupName != null && cameraGroupName != "") {
      name = cameraGroupName;
    } else {
      name = data['cameraName'];
    }

    if (cameraNameStorage != null && cameraNameStorage != "") {
      groupname = cameraNameStorage;
    } else {
      groupname = data['groupName'];
    }
    update();
  }

  //get cameraView data
  getCameraViewData() async {
    print('calling');
    try {
      isLoading = true;
      String cameraGroupId = await Helper().getStorage('camera_groups_uuid');
      String cameraID = await Helper().getStorage('camera_uuid');
      if (cameraGroupId != null && cameraGroupId != "") {
        camera_groups_uuid = cameraGroupId;
      } else {
        camera_groups_uuid = data['camera_groups_uuid'];
      }

      if (cameraID != null && cameraID != "") {
        camera_uuid = cameraID;
      } else {
        camera_uuid = data['camera_uuid'];
      }

      print('camera_uuid : $camera_uuid');
      print('camera_groups_uuid : $camera_groups_uuid');
      update();
      List requestData = [];
      var userData = await Helper().getStorage('userData');

      bool isToken = await CommonController().checkTokenValidation();
      if (isToken) {
        print(requestData.toString());
        var resData = await apis.apiCall(
            'users/${userData['uuid']}/camera-groups/${camera_groups_uuid}/cameras/$camera_uuid',
            requestData,
            'get');
        print('status :${resData.statusCode}');
        if (resData.statusCode == 200) {
          var imagedata =[
            resData.body['thumbnail_url'],

          ];
          resData.body['imagesArray'] = imagedata;
          data = resData.body;
          print('data : $data');
          date = DateFormat('MM/dd/yyyy')
              .format(DateTime.parse(data["image_received_at"]));
          time = DateFormat(' hh:mm:ss a')
              .format(DateTime.parse(data["image_received_at"]));
          update();
        } else {
          print('Error while getting userData');
        }
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
        Get.offAllNamed(routeName.loginScreen);
      }
    } catch (e) {
      isLoading = false;
      //update();
      print(e);
    }
  }

  //willpop scope back
  onBackFunction()async{
    String type = await Helper().getStorage('type');
    if (type == 'cameraview') {
      String name = await Helper().getStorage('cameraName');
      String cameraGroupId =
      await Helper().getStorage('camera_groups_uuid');
      var data = {'name': name, 'id': cameraGroupId};
      Get.toNamed(routeName.groupCameraList, arguments: data);
      await Helper().writeStorage('camera_uuid', '');
    } else {
      Get.back();
    }

  }

  //aapbar back function
onBackAppBar()async{
  String type = await Helper().getStorage('type');
  print('type : $type');
  if (type == 'cameraview') {
    data['thumbnail_url'] = imageAssets.cameraNote;
    String name = await Helper().getStorage('cameraName');
    String cameraGroupId =
    await Helper().getStorage('camera_groups_uuid');
    var argdata = {'name': name, 'id': cameraGroupId};
    Get.toNamed(routeName.groupCameraList, arguments: argdata);
    await Helper().writeStorage('camera_uuid', '');
  } else {
    Get.back();
  }
}

}
