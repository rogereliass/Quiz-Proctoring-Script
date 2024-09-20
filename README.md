# Proctoring-Assignment-Script 
# TA Proctoring Assignment System

This project implements a Prolog program to assign Teaching Assistants (TAs) to proctor quizzes based on their teaching schedules. The system ensures that assignments meet specific constraints, such as availability, teaching conflicts, and days off. It can find possible assignments of TAs to quizzes, verify given assignments, or output `false` if no valid assignment exists.

## Project Overview

The system assigns TAs to proctor quizzes while respecting several constraints:

- Each quiz requires a specific number of proctors.
- TAs cannot proctor quizzes during their teaching slots.
- TAs cannot proctor on their designated day off.
- TAs cannot be assigned to multiple quizzes during the same time slot.

The program uses Prolog's logical reasoning capabilities to find valid proctoring assignments, verify existing assignments, or determine that no valid assignment exists.

## Key Features

- **Dynamic Assignment**: Automatically assigns TAs to quizzes while satisfying all constraints.
- **Conflict Checking**: Ensures TAs are not assigned during teaching times, days off, or overlapping quizzes.
- **Verification**: Verifies if a given assignment is valid based on the constraints.
- **Constraint-Based Scheduling**: Uses Prolog rules to manage and enforce assignment constraints.

## Constraints

1. **Proctors Required**: Each quiz has a required number of proctors that must be met.
2. **Teaching Conflict**: A TA cannot be assigned to a quiz that conflicts with their teaching schedule.
3. **Days Off**: TAs cannot be assigned to quizzes on their scheduled days off.
4. **Single Slot Assignment**: A TA cannot proctor more than one quiz at the same time.

## How It Works

1. **Input Data**:
   - Teaching schedules of TAs.
   - Quiz timings and required number of proctors.
   - TAs' day off schedules.

2. **Prolog Rules**:
   - Define constraints for valid proctoring assignments.
   - Use Prolog's backtracking to explore possible assignments.
   - Verify assignments or find solutions based on input data.

3. **Output**:
   - A list of valid TA-to-quiz assignments.
   - Verification of given assignments.
   - `false` if no valid assignments exist.

## Contact

For questions or feedback, please contact [roger.elias669@gmail.com](mailto:roger.elias669@gmail.com).
