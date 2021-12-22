
class AppArray {

  //exercise list
  var exerciseList = [
    {
      'id': '1',
      'title' :'Simple stepup',
      'image':'assets/images/simple_stepup.jpg',
      'status': "up-to-date",
    },
    {
      'id': '2',
      'title' :'knee Flexion Standing',
      'image':'assets/images/knee_flexion_standing.jpg',
      'status': "needs download",
    },
    {
      'id': '3',
      'title' :'Leg circling',
      'image':'assets/images/knee_circling.jpg',
      'status': "up-to-date",
    },
    {
      'id': '4',
      'title' :'Squat',
      'image':'assets/images/squat.jpg',
      'status': "out-of-sync",
    },
    {
      'id': '5',
      'title' :'Crunch',
      'image':'assets/images/crunch.jpg',
      'status': "out-of-sync",
    },
    {
      'id': '6',
      'title' :'Lunges',
      'image':'assets/images/lunges.jpg',
      'status': "up-to-date",
    }
  ];

  //list of exercise detail
  var exerciseDetailData = [
    {
      'id': '1',
      'title': 'Simple stepup',
      'image': 'assets/images/simple_stepup.jpg',
      'steps': [
        {
          'step':
          'To start, place your entire right foot onto the step, chair, box, or bench.'
        },
        {
          'step':
          'Return to the starting position by stepping down with the right foot, then the left so both feet are on the floor.',
        },
        {
          'step':
          'Complete 15 steps leading with the left foot, then repeat another 15 steps leading with your left foot.',
        }
      ],
      'isShow': false,
      'noOfSteps':3,
      'reps': 20,
      'formPerc':25,
      'status': "up-to-date",
    },
    {
      'id': '2',
      'title': 'knee Flexion Standing',
      'image': 'assets/images/knee_flexion_standing.jpg',
      'steps': [
        {
          'step':
          'Stand straight with the knees only 1–2 inches apart, hold on to a stable chair, the countertop, or another object for balance',
        },
        {
          'step':
          'Slowly bend one knee behind the body, lifting the heel off the floor while keeping the thighs aligned.'
        },
        {
          'step':
          'Continue to lift the heel in a smooth motion until the knee bend reaches a 90-degree angle. Keep the straight leg slightly bent to avoid locking it.'
        },
        {
          'step':
          'Hold the bent leg up for 5 seconds and then slowly lower it to the floor.'
        },
        {
          'step': 'Repeat two more times with the same leg.',
        },
        {
          'step': 'Switch sides and repeat.',
        },
      ],
      'isShow': true,
      'noOfSteps':2,
      'reps': 25,
      'formPerc':35,
      'status': "needs download",
    },
    {
      'id': '3',
      'title': 'Leg circling',
      'image': 'assets/images/knee_circling.jpg',
      'steps': [
        {
          'step':
          'Lay down with your back flat on the floor and your arms on your side. Place the small ball under your right foot.'
        },
        {
          'step':
          'Point your left leg straight up to the ceiling. Rotate your leg in small circles clockwise and then counter clockwise.'
        },
        {
          'step':
          'Lower your left leg down onto the ball and then repeat the motion with your right leg for the desired amount of time.'
        },
      ],
      'isShow': true,
      'noOfSteps':4,
      'reps': 15,
      'formPerc':45,
      'status': "up-to-date",
    },
    {
      'id': '4',
      'title': 'Squat',
      'image': 'assets/images/squat.jpg',
      'steps': [
        {
          'step':
          'Stand with feet a little wider than hip width, toes facing front.'
        },
        {
          'step':
          'Drive your hips back—bending at the knees and ankles and pressing your knees slightly open—as you.',
        },
        {
          'step':
          'Sit into a squat position while still keeping your heels and toes on the ground, chest up and shoulders back.',
        },
        {
          'step':
          'Strive to eventually reach parallel, meaning knees are bent to a 90-degree angle.',
        },
        {
          'step':
          'Press into your heels and straighten legs to return to a standing upright position.',
        }
      ],
      'isShow': false,
      'noOfSteps':3,
      'reps': 40,
      'formPerc':75,
      'status': "out-of-sync",
    },
    {
      'id': '5',
      'title': 'Crunch',
      'image': 'assets/images/crunch.jpg',
      'steps': [
        {
          'step':
          'Lie down on your back. Plant your feet on the floor, hip-width apart.',
        },
        {
          'step':
          'Bend your knees and place your arms across your chest. Contract your abs and inhale.',
        },
        {
          'step':
          'Exhale and lift your upper body, keeping your head and neck relaxed.',
        },
        {
          'step': 'Inhale and return to the starting position.',
        }
      ],
      'isShow': false,
      'noOfSteps':3,
      'reps': 20,
      'formPerc':42,
      'status': "out-of-sync",
      'status': "needs download",
    },
    {
      'id': '6',
      'title': 'Lunges',
      'image': 'assets/images/lunges.jpg',
      'steps': [
        {
          'step': 'Start in a standing position with your feet hip-width apart.'
        },
        {
          'step':
          'Step forward longer than a walking stride so one leg is ahead of your torso and the other is behind.',
        },
        {
          'step':
          'Your foot should land flat and remain flat while it’s on the ground. Your rear heel will rise off of the ground.',
        },
        {
          'step':
          'Bend your knees to approximately 90 degrees as you lower yourself. Remember to keep your trunk upright and core engaged.',
        },
        {
          'step':
          'hen, forcefully push off from your front leg to return to the starting position.',
        }
      ],
      'isShow': false,
      'noOfSteps':3,
      'reps': 20,
      'formPerc':25,
      'status': "up-to-date",
    }
  ];


}
