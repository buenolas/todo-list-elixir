# Todo List Application

Welcome to the Todo List application! This is a web application built using Elixir, Phoenix Framework, and PostgreSQL. It allows users to manage their tasks efficiently with features for authentication, task creation, updating, and deletion. The application is designed to ensure that users can only access and manage their own tasks.

## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Notes](#notes)

## Features

- User authentication (registration, login, and logout)
- Task management (create, read, update, delete)
- Tasks are associated with individual users
- User-specific task visibility and management
- Email notifications for new user registrations via Mailgun

## Tech Stack

- **Backend:** Elixir, Phoenix Framework
- **Database:** PostgreSQL
- **Authentication:** Phoenix Generator Auth
- **Email Service:** Mailgun
- **Containerization:** Docker (for deployment)

## Installation

To get started with this project, follow these steps:

1. **Clone the Repository**

   ```sh
   git clone https://github.com/yourusername/todo_list_elixir.git
   cd todo_list_elixir
   ```

2. **Get Dependencies**

   ```sh
   mix deps.get
   ```
3. **Create .env file**
   In this part unfortnately, Im still trying to figure it out how to keep those informations hiden in the repository but when it get cloned they would still be available.
   ```sh
   DATABASE_URL=your_database_url
   SECRET_KEY_BASE=your_secret_key_base
   API_KEY=your_api_key
   ```
   So actually there's nothing much you can do unless you have a Mailgun API Key and a Domain registered on Mailgun, then you can put your values and it will work.

4. **Setup and Start the Application**

   Ensure you have Docker and Docker Compose installed. Run the following command to build and start the containers:

   ```sh
   docker compose up --build
   ```

   The application will be available at `http://localhost:4000`.

## Usage

1. **User Registration and Login**

   - Navigate to `http://localhost:4000` to create a new account.

2. **Task Management**

   - After logging in, you can manage your tasks.
   - Create a new task.
   - Edit or delete existing tasks from the task list.

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Notes

The project will be hosted on AWS in the future, so no longer will be needed to clone it.

---
