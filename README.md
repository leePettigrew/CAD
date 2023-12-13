# CAD

## Overview
CAD is a Ruby on Rails application designed for efficient management and organization of personal contact information. The application features a robust interface for handling individual records, along with advanced functionalities for CSV file import and export.

## Features
- **People Management**: Facilitates the addition, modification, viewing, and deletion of personal contact records.
- **CSV File Integration**: Offers capabilities for importing data from CSV files and exporting the database contents back into CSV format.
- **Search Functionality**: Includes a search feature to quickly locate specific records based on various criteria.

## Getting Started

### Prerequisites
Ensure you have Ruby and Rails installed on your system. The application is built on Ruby on Rails, so familiarity with these technologies is beneficial.

### Installation
1. **Clone the repository:**
   ```bash
   git clone https://github.com/leePettigrew/CAD
   ```
2. **Navigate to the application directory:**
   ```bash
   cd CAD
   ```
3. **Install the required gems:**
   ```bash
   bundle install
   ```
4. **Set up the database:**
   ```bash
   rails db:create db:migrate
   ```
5. **Start the Rails server:**
   ```bash
   rails server
   ```
6. **Access the application** by navigating to `http://localhost:3000` in your web browser.

## Usage
- **Adding a New Contact**: Navigate to the 'Add Person' section to input new contact details into the system.
- **Editing and Deleting Contacts**: Each contact record can be edited or deleted as required through the interface.
- **Importing Data**: Use the CSV upload functionality to import multiple contacts simultaneously from a CSV file.
- **Exporting Data**: The application allows exporting the current contact data to a CSV file for external use.
- **Searching for Contacts**: Utilize the search bar to quickly find specific contacts based on the provided search criteria.
