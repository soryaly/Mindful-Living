// Start of Mindful Living

//1.
import UIKit

class MindfulLivingViewController: UIViewController {

//2.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup view
        setupView()
    }
    
//3.
    private func setupView() {
        // Setup background
        let backgroundView = UIImageView(frame: view.frame)
        backgroundView.image = UIImage(named: "background")
        view.addSubview(backgroundView)
        
//4.
        // Setup title
        let titleLabel = UILabel()
        titleLabel.text = "Mindful Living"
        titleLabel.frame = CGRect(x: 0, y: 20, width: view.frame.width, height: 50)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.addSubview(titleLabel)

//5.
        // Setup buttons
        let meditateButton = UIButton()
        meditateButton.setTitle("Meditate", for: .normal)
        meditateButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        meditateButton.backgroundColor = UIColor.blue
        meditateButton.frame = CGRect(x: 0, y: 80, width: view.frame.width, height: 50)
        meditateButton.addTarget(self, action: #selector(didTapMeditateButton), for: .touchUpInside)
        view.addSubview(meditateButton)

//6.
        let practiceYogaButton = UIButton()
        practiceYogaButton.setTitle("Practice Yoga", for: .normal)
        practiceYogaButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        practiceYogaButton.backgroundColor = UIColor.blue
        practiceYogaButton.frame = CGRect(x: 0, y: 140, width: view.frame.width, height: 50)
        practiceYogaButton.addTarget(self, action: #selector(didTapPracticeYogaButton), for: .touchUpInside)
        view.addSubview(practiceYogaButton)

//7.
        let eatHealthyButton = UIButton()
        eatHealthyButton.setTitle("Eat Healthy", for: .normal)
        eatHealthyButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        eatHealthyButton.backgroundColor = UIColor.blue
        eatHealthyButton.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: 50)
        eatHealthyButton.addTarget(self, action: #selector(didTapEatHealthyButton), for: .touchUpInside)
        view.addSubview(eatHealthyButton)

//8.
        let journalButton = UIButton()
        journalButton.setTitle("Journal", for: .normal)
        journalButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        journalButton.backgroundColor = UIColor.blue
        journalButton.frame = CGRect(x: 0, y: 260, width: view.frame.width, height: 50)
        journalButton.addTarget(self, action: #selector(didTapJournalButton), for: .touchUpInside)
        view.addSubview(journalButton)

//9.
        let exerciseButton = UIButton()
        exerciseButton.setTitle("Exercise", for: .normal)
        exerciseButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        exerciseButton.backgroundColor = UIColor.blue
        exerciseButton.frame = CGRect(x: 0, y: 320, width: view.frame.width, height: 50)
        exerciseButton.addTarget(self, action: #selector(didTapExerciseButton), for: .touchUpInside)
        view.addSubview(exerciseButton)

//10.
        let getEnoughSleepButton = UIButton()
        getEnoughSleepButton.setTitle("Get Enough Sleep", for: .normal)
        getEnoughSleepButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        getEnoughSleepButton.backgroundColor = UIColor.blue
        getEnoughSleepButton.frame = CGRect(x: 0, y: 380, width: view.frame.width, height: 50)
        getEnoughSleepButton.addTarget(self, action: #selector(didTapGetEnoughSleepButton), for: .touchUpInside)
        view.addSubview(getEnoughSleepButton)
    }

//11.
    @objc func didTapMeditateButton() {
        // Show alert
        let alertController = UIAlertController(title: "Meditate", message: "Take a few deep breaths and clear your mind.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

//12.
    @objc func didTapPracticeYogaButton() {
        // Show alert
        let alertController = UIAlertController(title: "Practice Yoga", message: "Take a few moments to practice yoga to help you relax and find peace within yourself.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

//13.
    @objc func didTapEatHealthyButton() {
        // Show alert
        let alertController = UIAlertController(title: "Eat Healthy", message: "Choose nourishing foods to fuel your body.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

//14.
    @objc func didTapJournalButton() {
        // Show alert
        let alertController = UIAlertController(title: "Journal", message: "Write down your thoughts and feelings to help you process and understand yourself better.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

//15.
    @objc func didTapExerciseButton() {
        // Show alert
        let alertController = UIAlertController(title: "Exercise", message: "Physical activity can help boost your mood and reduce stress.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

//16.
    @objc func didTapGetEnoughSleepButton() {
        // Show alert
        let alertController = UIAlertController(title: "Get Enough Sleep", message: "Make sure to get enough rest at night for your body to repair and rejuvenate.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

//17.
extension MindfulLivingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//18.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

//19.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Meditate"
        case 1:
            cell.textLabel?.text = "Practice Yoga"
        case 2:
            cell.textLabel?.text = "Eat Healthy"
        case 3:
            cell.textLabel?.text = "Journal"
        case 4:
            cell.textLabel?.text = "Exercise"
        default:
            cell.textLabel?.text = "Get Enough Sleep"
        }
        return cell
    }

//20.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            didTapMeditateButton()
        case 1:
            didTapPracticeYogaButton()
        case 2:
            didTapEatHealthyButton()
        case 3:
            didTapJournalButton()
        case 4:
            didTapExerciseButton()
        default:
            didTapGetEnoughSleepButton()
        }
    }

}

// End of Mindful Living