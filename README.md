---

# Todo List Application

Welcome to the Todo List application! This is a web application built using Elixir, Phoenix Framework, and PostgreSQL. It allows users to manage their tasks efficiently with features for authentication, task creation, updating, and deletion. The application is designed to ensure that users can only access and manage their own tasks.

## Table of Contents

- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Features

- User authentication (registration, login, and logout)
- Task management (create, read, update, delete)
- Tasks are associated with individual users
- User-specific task visibility and management
- Redirects to login page and tasks page after login

## Tech Stack

- **Backend:** Elixir, Phoenix Framework
- **Database:** PostgreSQL
- **Authentication:** Phoenix Generator Auth
- **Containerization:** Docker (for deployment)

## Installation

To get started with this project, follow these steps:

1. **Clone the Repository**

   ```sh
   git clone https://github.com/yourusername/todo_list.git
   cd todo_list
   ```

2. **Install Dependencies**

   Ensure you have [Elixir](https://elixir-lang.org/install.html) and [Phoenix](https://www.phoenixframework.org/) installed. Then, install the necessary dependencies:

   ```sh
   mix deps.get
   ```

3. **Setup the Database**

   Run the docker compose file:

   ```sh
   docker compose up -d
   ```

4. **Start the Phoenix Server**

   Run the Phoenix server:

   ```sh
   mix phx.server
   ```

   Visit `http://localhost:4000` in your browser.

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

---
