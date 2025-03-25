//
//  DataManager.swift
//  CricketDafa
//
//  Created by D K on 22.03.2025.
//

import Foundation



class DataManager {
    static let shared = DataManager()
    
    private init(){}
    
    var achievements: [History] = [
        History(title: "First Match Followed", about: "", image: "trophy"),
        History(title: "Daily Streak 5 day", about: "", image: "trophy"),
        History(title: "Training Streak 2 week", about: "", image: "trophy"),
        History(title: "Skill Mastery: Batting", about: "", image: "trophy"),
        History(title: "Precision Award", about: "", image: "trophy"),
        History(title: "Fielding Excellence", about: "", image: "trophy"),
        History(title: "Fitness Milestone", about: "", image: "trophy"),
        History(title: "Team Player Award", about: "", image: "trophy"),
        History(title: "Skill Diversification", about: "", image: "trophy")
    ]
    
    var tips: [History] = [
        History(title: "Master the Basics", about: "Before attempting advanced techniques, ensure you have a strong foundation in the basics. Practice your grip to control the bat effectively, and work on maintaining a balanced stance to react quickly to different deliveries. Spend time mastering basic shots such as the drive, cut, and pull to build confidence and consistency in your batting. Regularly review and refine these fundamentals to improve your overall game.", image: "i12"),
        History(title: "Situational Awareness", about: "Understanding the match situation is crucial for making strategic decisions. Pay attention to the field placements, the bowler's strengths, and the required run rate. Adapt your batting or bowling approach based on these factors. For example, if your team needs quick runs, focus on hitting boundaries, but if wickets are falling, prioritize defense and rotating the strike. Developing this awareness helps you make better decisions under pressure.", image: "i13"),
        History(title: "Improve Fitness and Agility", about: "Cricket is a physically demanding sport that requires a combination of strength, speed, and endurance. Incorporate a mix of cardiovascular exercises, strength training, and agility drills into your fitness routine. This will help you maintain high energy levels throughout a match, improve your running between wickets, and enhance your fielding skills. A fitter body also recovers faster from injuries, allowing you to play more consistently.", image: "i14"),
        History(title: "Practice Mental Toughness", about: "Mental strength is as important as physical fitness in cricket. Develop techniques to manage stress and maintain focus during high-pressure situations. Visualize successful outcomes, practice positive self-talk, and learn to stay calm under pressure. Mental toughness helps you make better decisions, recover from setbacks, and perform consistently, even in challenging conditions.", image: "i15"),
        History(title: "Learn from Mistakes", about: "Regularly analyze your performances, whether through video analysis or feedback from coaches and teammates. Identify patterns in your mistakes and work on correcting them. Reflect on what went well and what could be improved. Use this feedback to set goals for future training sessions and matches. Continuous learning and adaptation are key to improving your skills and becoming a more effective player.", image: "i16")
    ]
    
    var histories: [History] = [
    History(title: "Origins and Early Development", about: "Cricket's origins can be traced back to the 16th century in southeast England, where it was initially a children's game. The earliest known adult cricket match occurred around 1611 in Sussex, England. The game's popularity grew among adults in the early 17th century, particularly in the rural areas of England.", image: "i7"),
    History(title: "Formalization of Rules", about: "The rules of cricket were first formalized in the 18th century. In 1744, the first known Laws of Cricket were written, and the stumps' width was standardized. The Marylebone Cricket Club (MCC) was founded in 1787 and became the authority for the game's rules, which it continues to oversee today. The MCC's influence helped standardize the game and promote its growth.", image: "i8"),
    History(title: "International Expansion", about: "Cricket spread globally with the expansion of the British Empire. The first international cricket match was played between Canada and the United States in 1844 at the St George's Cricket Club in New York. However, the most significant milestone in international cricket came in 1877 when England and Australia played the first-ever Test match in Melbourne. This marked the beginning of Test cricket, the longest and most traditional format of the game.", image: "i9"),
    History(title: "Evolution of Formats", about: "Over the years, cricket has evolved to include various formats to cater to different audiences and playing conditions. One Day Internationals (ODIs) were introduced in the 1970s, featuring 50 overs per side and providing a faster-paced alternative to Test cricket. The first ODI was played in 1971 between England and Australia.", image: "i10"),
    History(title: "Modern Era", about: "Today, cricket is played professionally in numerous countries, with major international tournaments like the ICC Cricket World Cup, ICC T20 World Cup, and the ICC Champions Trophy. The sport continues to evolve, with ongoing discussions about new formats and innovations to keep the game engaging and relevant for modern audiences.", image: "i11")
    ]
    
    var trainings: [Training] = [
        Training(
            title: "Full Body Warm-up",
            shortDescription: "Essential warm-up routine to prepare muscles and joints for cricket training.",
            longDescription: "This comprehensive warm-up prepares all major muscle groups for cricket-specific movements, reducing injury risk and improving performance. Focus on dynamic stretches and mobility exercises that mimic cricket actions.",
            image: "i2",
            steps: [
                TrainingStep(stepNumber: 1, description: "Jogging - 3 minutes of light jogging to raise body temperature"),
                TrainingStep(stepNumber: 2, description: "Arm Circles - 30 seconds forward, 30 seconds backward"),
                TrainingStep(stepNumber: 3, description: "Leg Swings - 10 swings per leg, front to back and side to side"),
                TrainingStep(stepNumber: 4, description: "Lunges with Twist - 8 reps per leg with upper body rotation"),
                TrainingStep(stepNumber: 5, description: "High Knees - 30 seconds"),
                TrainingStep(stepNumber: 6, description: "Butt Kicks - 30 seconds"),
                TrainingStep(stepNumber: 7, description: "Shoulder Rotations with Bat - 10 rotations each direction"),
                TrainingStep(stepNumber: 8, description: "Side Shuffles - 30 seconds each direction"),
                TrainingStep(stepNumber: 9, description: "Dynamic Hamstring Stretch - 8 reps per leg"),
                TrainingStep(stepNumber: 10, description: "Wrist and Ankle Rotations - 15 seconds each joint")
            ]
        ),
        Training(
            title: "Batting Off the Bounce",
            shortDescription: "Players practice hitting the ball after it bounces off the ground.",
            longDescription: "This drill focuses on improving a player's ability to hit the ball accurately after it bounces off the pitch. Players stand at the crease while a coach or teammate throws the ball to simulate a bowler's delivery.",
            image: "i3",
            steps: [
                TrainingStep(stepNumber: 1, description: "Assume correct batting stance"),
                TrainingStep(stepNumber: 2, description: "Focus on the ball as it leaves the bowler's hand"),
                TrainingStep(stepNumber: 3, description: "Watch the ball closely as it bounces"),
                TrainingStep(stepNumber: 4, description: "Decide shot selection based on bounce and line"),
                TrainingStep(stepNumber: 5, description: "Execute the shot with proper technique"),
                TrainingStep(stepNumber: 6, description: "Follow through completely"),
                TrainingStep(stepNumber: 7, description: "Return to ready position")
            ]
        ),
        Training(
            title: "Target Bowling",
            shortDescription: "Players throw the ball at specific targets to improve bowling accuracy.",
            longDescription: "In this exercise, bowlers aim to hit specific targets, such as cones or marked areas, to improve their accuracy.",
            image: "i4",
            steps: [
                TrainingStep(stepNumber: 1, description: "Mark target areas on the pitch"),
                TrainingStep(stepNumber: 2, description: "Start with basic line and length targets"),
                TrainingStep(stepNumber: 3, description: "Progress to smaller, more precise targets"),
                TrainingStep(stepNumber: 4, description: "Incorporate variations (swing, spin, pace)"),
                TrainingStep(stepNumber: 5, description: "Challenge with moving targets or sequences"),
                TrainingStep(stepNumber: 6, description: "Record success rates for each target type")
            ]
        ),
        Training(
            title: "Wicket-to-Wicket Sprints",
            shortDescription: "Players perform short sprints between the wickets, mimicking game situations.",
            longDescription: "Players perform quick sprints between the wickets to mimic the urgent running required during a match.",
            image: "i5",
            steps: [
                TrainingStep(stepNumber: 1, description: "Start in batting stance at one crease"),
                TrainingStep(stepNumber: 2, description: "On signal, sprint to opposite crease"),
                TrainingStep(stepNumber: 3, description: "Touch bat behind the line"),
                TrainingStep(stepNumber: 4, description: "Immediately return to starting position"),
                TrainingStep(stepNumber: 5, description: "Repeat for 6-8 repetitions"),
                TrainingStep(stepNumber: 6, description: "Add variations (turning, sliding, calling)")
            ]
        ),
        Training(
            title: "Catching Drills",
            shortDescription: "Players practice catching balls thrown from various distances and angles.",
            longDescription: "Players practice catching balls thrown from various distances and angles to improve their fielding skills.",
            image: "i2",
            steps: [
                TrainingStep(stepNumber: 1, description: "Start with basic high catches"),
                TrainingStep(stepNumber: 2, description: "Progress to low catches and diving"),
                TrainingStep(stepNumber: 3, description: "Practice close-in catching (slips, gully)"),
                TrainingStep(stepNumber: 4, description: "Work on boundary catches"),
                TrainingStep(stepNumber: 5, description: "Add movement before catch"),
                TrainingStep(stepNumber: 6, description: "Incorporate reaction drills")
            ]
        ),
        Training(
            title: "Power Hitting",
            shortDescription: "Players focus on executing powerful shots aimed at sending the ball as far as possible.",
            longDescription: "This drill focuses on developing the ability to hit the ball with maximum power, aiming to clear the boundary for sixes.",
            image: "i3",
            steps: [
                TrainingStep(stepNumber: 1, description: "Focus on strong base and grip"),
                TrainingStep(stepNumber: 2, description: "Generate power from legs and core"),
                TrainingStep(stepNumber: 3, description: "Practice full follow-through"),
                TrainingStep(stepNumber: 4, description: "Start with tee drills"),
                TrainingStep(stepNumber: 5, description: "Progress to underarm feeds"),
                TrainingStep(stepNumber: 6, description: "Finally full bowling"),
                TrainingStep(stepNumber: 7, description: "Target specific areas (mid-wicket, long-on)")
            ]
        ),
        Training(
            title: "Footwork Agility Drill",
            shortDescription: "Improve foot speed and movement efficiency for better batting and fielding.",
            longDescription: "This drill enhances a player's ability to move quickly and efficiently in all directions, crucial for both batting and fielding.",
            image: "i4",
            steps: [
                TrainingStep(stepNumber: 1, description: "Set up agility ladder or cones"),
                TrainingStep(stepNumber: 2, description: "Practice forward and backward movements"),
                TrainingStep(stepNumber: 3, description: "Add lateral shuffles"),
                TrainingStep(stepNumber: 4, description: "Incorporate bat movements"),
                TrainingStep(stepNumber: 5, description: "Add ball tracking element"),
                TrainingStep(stepNumber: 6, description: "Time drills for speed improvement")
            ]
        ),
        Training(
            title: "Spin Bowling Mastery",
            shortDescription: "Develop control and variation for spin bowlers.",
            longDescription: "Focused training for spin bowlers to improve grip, rotation, and consistency of their deliveries.",
            image: "i5",
            steps: [
                TrainingStep(stepNumber: 1, description: "Focus on basic grip for each variation"),
                TrainingStep(stepNumber: 2, description: "Practice wrist position and release"),
                TrainingStep(stepNumber: 3, description: "Work on consistent length"),
                TrainingStep(stepNumber: 4, description: "Develop flight and dip"),
                TrainingStep(stepNumber: 5, description: "Add variations (topspin, sidespin)"),
                TrainingStep(stepNumber: 6, description: "Practice setting up batsmen")
            ]
        ),
        Training(
            title: "Reflex Batting",
            shortDescription: "Improve reaction time and hand-eye coordination for quick responses.",
            longDescription: "This high-intensity drill trains batsmen to react quickly to unexpected deliveries and improve their defensive techniques.",
            image: "i1",
            steps: [
                TrainingStep(stepNumber: 1, description: "Use close-range underarm feeds"),
                TrainingStep(stepNumber: 2, description: "Vary speed and angle unpredictably"),
                TrainingStep(stepNumber: 3, description: "Focus on quick reactions"),
                TrainingStep(stepNumber: 4, description: "Practice defensive blocks first"),
                TrainingStep(stepNumber: 5, description: "Progress to controlled attacks"),
                TrainingStep(stepNumber: 6, description: "Use reaction balls for advanced training")
            ]
        ),
        Training(
            title: "Fielding Fitness Circuit",
            shortDescription: "Combine fielding skills with cardiovascular conditioning.",
            longDescription: "This circuit training combines various fielding skills with fitness elements to simulate match conditions where tiredness affects performance.",
            image: "i2",
            steps: [
                TrainingStep(stepNumber: 1, description: "Set up multiple fielding stations"),
                TrainingStep(stepNumber: 2, description: "Include throwing, catching, ground work"),
                TrainingStep(stepNumber: 3, description: "Add fitness elements between stations"),
                TrainingStep(stepNumber: 4, description: "Complete 3-5 rounds"),
                TrainingStep(stepNumber: 5, description: "Focus on technique despite fatigue"),
                TrainingStep(stepNumber: 6, description: "Time each round for progression")
            ]
        ),
        Training(
            title: "Yorker Accuracy Challenge",
            shortDescription: "Master the art of bowling perfect yorkers consistently.",
            longDescription: "This specialized drill helps bowlers develop the skill of bowling yorkers - the most effective delivery in death overs.",
            image: "i3",
            steps: [
                TrainingStep(stepNumber: 1, description: "Mark yorker target area"),
                TrainingStep(stepNumber: 2, description: "Practice run-up and release point"),
                TrainingStep(stepNumber: 3, description: "Focus on full extension at delivery"),
                TrainingStep(stepNumber: 4, description: "Aim for base of stumps"),
                TrainingStep(stepNumber: 5, description: "Add pressure scenarios"),
                TrainingStep(stepNumber: 6, description: "Track consistency percentage")
            ]
        )
    ]
}
