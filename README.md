# Rails Chat System
* Building a chat system using Ruby on Rails, the system is to receive many requests. It might be running on multiple servers in
parallel and thus multiple requests may be processed concurrently. It handles race
conditions. It minimizes the queries and avoids writing directly to MySQL while serving the
requests(especially for the chats and messages creation endpoints) and it uses a queuing
system to achieve that and the app is containerized.
## Languages and frameworks 📑
* Ruby on Rails
* MySql
* ElasticSearch
* Redis
* Sidekiq
## Features 🥇
* Easy create, update and show apps, chats and messages using Ruby on Rails framework.
## Cloning the repo and starting the app
* clone the repository and open the project in any IDE
``` bash
git clone https://github.com/MohamedRagaab/chat-system-rails.git
cd chat-system-rails
```
* You can run the following command to start the app
``` bash
docker compose up
```
or 
``` bash
docker-compose up
```
## Usage 🚀
* Here is the list of the RESTful APIs
  - Application:
 
    - Create a new application:
        ``` bash
        POST /api/v1/applications
        ```
    - Read a specific application:
        ``` bash
        GET /api/v1/applications/:token
        ```
    - Update a specific application:
        ``` bash
        PUT /api/v1/applications/:token
        ```

  - Chats:
 
    - Create a new chat:
        ``` bash
        POST /api/v1/applications/:token/chats
        ```
    - List chats under a specific application:
        ``` bash
        GET /api/v1/applications/:token/chats
        ```
        
  - Message:
 
    - Create a new message:
        ``` bash
        POST /api/v1/applications/:token/chats/:number/messages
        ```
    - Read a specific message under a chat:
        ``` bash
        GET /api/v1/applications/:token/chats/:chat_number/messages/:message_number
        ```
    - Update a specific message:
        ``` bash
        PUT /api/v1/applications/:token/chats/:number/messages/:id
        ```
    - List all messages under a specific chat:
        ``` bash
        GET /api/v1/applications/:token/chats/:number/messages
        ```

## Examples 🖼️
* Create an application
<div align='center'>
<img height="350px" src="https://github.com/MohamedRagaab/Instabug-Backend-Challenge/assets/38363762/1d3e1d04-67e0-48a2-a48b-e64d14f18808">
<hr/>
</div>

* Create a chat under the app
<div align='center'>
<img height="350px" src="https://github.com/MohamedRagaab/Instabug-Backend-Challenge/assets/38363762/26033bfa-6fcc-4a61-a628-559fc7adfaf3">
<hr/>
</div>

* Create a message under the chat
<div align='center'>
<img height="350px" src="https://github.com/MohamedRagaab/Instabug-Backend-Challenge/assets/38363762/e6fc4235-4f36-4228-b0e1-593efb2581bb">
<hr/>
</div>

* search the message under the chat
<div align='center'>
<img height="350px" src="https://github.com/MohamedRagaab/Instabug-Backend-Challenge/assets/38363762/405315fe-1abe-4438-a5c0-ae58c91e5691">
<hr/>
</div>

## Repo Content :white_check_mark:
- [x] Application Endpoints
- [x] Chat Endpoints
- [x] Message Endpoint
- [x] Using elasticsearch for searching messages
- [x] Using queuing system (Sidekiq)
- [x] Counts chat and message numbers in background (cron job)
- [x] Containerize the app (docker-compose.yml)
- [x] Using in-memory DB (Redis)
- [x] Writing a Readme file

