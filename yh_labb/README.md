# YrkesCo Database Project

## Overview
This project implements a database system for YrkesCo, a vocational school with multiple locations. The database is designed to replace the current Excel-based management system, providing a structured solution for tracking students, educators, courses, programs, and other essential information.

## Project Structure
- **yh_create_table.sql**: Contains SQL commands to create all database tables
- **yh_insert_data.sql**: Contains SQL commands to insert sample data
- **yh_testing.sql**: Contains test queries to validate database functionality
- **additional_operations.sql**: Contains examples of inserting new records (locations, teachers, courses)

## Database Features
The database system supports:

- Tracking student information, including personal details and class assignments
- Managing educational programs and their associated courses
- Tracking both permanent educators and external consultants
- Supporting multiple geographical locations (Stockholm, Göteborg, with expansion capability)
- Organizing students into classes linked to programs
- Managing external consultants, their companies, and contracts
- Support for permanent teachers vs. consultants
- Education managers responsible for multiple classes
- Standalone courses (independent from programs)
- Multi-location support with expansion capability

## Database Schema
The database consists of the following primary tables:

- **Students** - Student information
- **Class** - Class information and program association
- **Programm** - Program details
- **Course** - Course information with standalone courses support
- **Teachers** - Teacher information with consultant status
- **EducationManager** - Education manager information
- **Location** - Location information for facilities
- **ConsultCompany** - Information about consultant companies
- **Contract** - Contract details for consultants
- **PersStudent**, **PersTeacher**, **PersEM** - Personal identification information
- **CourseProg**, **TeachCourse**, **ProgLoc** - Many-to-many relationship tables

## Technical Details
- The database is implemented in PostgreSQL
- The schema is designed to meet 3NF requirements
- Personal identification numbers are separated for privacy and security
- Foreign key constraints ensure data integrity
