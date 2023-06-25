/*
 * Mindful Living in C
 * Copyright (C) 2020  John Doe
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Defines used throughout the program
#define TRUE 1
#define FALSE 0
#define MAX_STR_LEN 128
#define MIN_STR_LEN 3

// Struct for storing mindfulness habits
typedef struct mindfulness_habit {
    char name[MAX_STR_LEN];
    char description[MAX_STR_LEN];
    char priority;
} MindfulnessHabit;

// Initializes a mindfulness habit
void initMindfulnessHabit(MindfulnessHabit* habit, char* name, char* description, char priority) {
    strncpy(habit -> name, name, MAX_STR_LEN);
    strncpy(habit -> description, description, MAX_STR_LEN);
    habit -> priority = priority;
}

// Prints a mindfulness habit
void printMindfulnessHabit(MindfulnessHabit* habit) {
    printf("%s (priority %c):\n%s\n\n", habit -> name, habit -> priority, habit -> description);
}

// Prints a list of mindfulness habits
void printMindfulnessHabitList(MindfulnessHabit* habitList, int numHabits) {
    for (int i = 0; i < numHabits; i++) {
        printMindfulnessHabit(&habitList[i]);
    }
}

// User input user-defined mindfulness habits
MindfulnessHabit* getMindfulnessHabits() {
    int numHabits;
    printf("Please enter the number of habits you want to create: ");
    scanf("%d", &numHabits);
    MindfulnessHabit* habitList = (MindfulnessHabit*) malloc(numHabits * sizeof(MindfulnessHabit));
    char name[MAX_STR_LEN];
    char description[MAX_STR_LEN];
    char priority;
    for (int i = 0; i < numHabits; i++) {
        printf("Please enter the name of habit %d: ", i + 1);
        scanf("%s", name);
        printf("Please enter the description of habit %d: ", i + 1);
        scanf("%s", description);
        printf("Please enter the priority of habit %d (Low - L, Medium - M, High - H): ", i + 1);
        scanf(" %c", &priority);
        initMindfulnessHabit(&habitList[i], name, description, priority);
    }
    return habitList;
}

// Sorts habits by priority
void prioritizeMindfulnessHabits(MindfulnessHabit* habitList, int numHabits) {
    for (int i = 0; i < numHabits; i++) {
        for (int j = 0; j < numHabits - 1; j++) {
            if (habitList[j].priority > habitList[j+1].priority) {
                MindfulnessHabit temp = habitList[j];
                habitList[j] = habitList[j+1];
                habitList[j+1] = temp;
            }
        }
    }
}

// Removes any duplicate habits
void checkForDuplicateHabits(MindfulnessHabit* habitList, int* numHabits) {
    for (int i = 0; i < *numHabits; i++) {
        for (int j = i+1; j < *numHabits; j++) {
            if(strcmp(habitList[i].name, habitList[j].name) == 0) {
                for (int k = j; k < *numHabits - 1; k++) {
                    habitList[k] = habitList[k + 1];
                }
                (*numHabits)--;
                j--;
            }
        }
    }
}

// Checks if string is valid
int checkStringValidity(char* str, int minLen, int maxLen) {
    if (str == NULL) return FALSE;
    int len = strlen(str);
    if (len < minLen || len > maxLen) return FALSE;
    return TRUE;
}

// Validates user input
int validateInput(MindfulnessHabit* habitList, int numHabits) {
    for (int i = 0; i < numHabits; i++) {
        if (!checkStringValidity(habitList[i].name, MIN_STR_LEN, MAX_STR_LEN))
            return FALSE;
        if (!checkStringValidity(habitList[i].description, MIN_STR_LEN, MAX_STR_LEN))
            return FALSE;
        if (habitList[i].priority != 'L' && habitList[i].priority != 'M' && habitList[i].priority != 'H')
            return FALSE;
    }
    return TRUE;
}

int main() {
    // Get user habits
    MindfulnessHabit* habitList = getMindfulnessHabits();
    int numHabits;
    printf("Please enter the number of habits you created: ");
    scanf("%d", &numHabits);
    // Validate user input
    if (!validateInput(habitList, numHabits)) {
        printf("Error: Invalid input.\n");
        exit(EXIT_FAILURE);
    }
    // Check for duplicates
    checkForDuplicateHabits(habitList, &numHabits);
    // Prioritize habits
    prioritizeMindfulnessHabits(habitList, numHabits);
    // Print habits
    printMindfulnessHabitList(habitList, numHabits);
    // Free up memory
    free(habitList);
    return 0;
}