import { MindfulLiving } from "./mindfulliving";

class MindfulLiving {
  private habits: string[];
  constructor(habits: string[]){
    this.habits = habits;
  }
 
  public practiceMindfulness(){
    let mindfulCount = 0;
    this.habits.forEach((habit) => {
      if(habit === "breathing" || habit === "meditation"){
        mindfulCount++;
      }
    });
    console.log(`You are practicing mindfulness ${mindfulCount} times a day!`);
  }
 
  public addHabits(newHabits: string[]){
    this.habits = [...this.habits, ...newHabits];
  }
 
  public deleteHabits(habitsToRemove: string[]){
    this.habits = this.habits.filter((habit) => !habitsToRemove.includes(habit));
  }
}
 
let mindfulLiving = new MindfulLiving(["reading", "breathing", "exercise", "meditation"]);
mindfulLiving.practiceMindfulness();
mindfulLiving.addHabits(["walking", "yoga"]);
mindfulLiving.deleteHabits(["exercise", "meditation"]);
mindfulLiving.practiceMindfulness();