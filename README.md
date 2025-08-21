# Deploy

The deploy repository for the Blokmap project, containing development and deployment configurations.

## Development

### 1. Cloning the repositories

Clone the necessary repositories to the current folder using the following commands:

```bash
git clone git@github.com:Blokmap/deploy.git
git clone git@github.com:Blokmap/frontend.git
git clone git@github.com:Blokmap/backend.git
```

### 2. Configure the environment file

In the `deploy` repository, in the `development` folder, create a `.env` file starting from the `.env.example` file:

```bash
cp .env.example .env
```

Make sure to fill in the necessary environment variables in the newly created `.env` file.

### 3. Generating secrets

In the `development` folder run the following command:

```bash
openssl rand -base64 -out secrets/cookie-jar-key 64
```

### 3. Creating a self-signed certificate

To run the project locally, you need to create a self-signed certificate. You can do this by running the following command in the `deploy/development/nginx/certs` folder:

```bash
openssl req -x509 -newkey rsa:4096 -keyout cert.key -out cert.crt -days 365 -nodes
```

This will create a self-signed certificate that will be used by the nginx reverse proxy. By default, you will get a warning in your browser that the certificate is not trusted, just click on the advanced settings and proceed to the website.

### 4. Configuring the hosts file

To run the project locally, you need to add the following line to your hosts file by running the following command:

On **Linux**:

```
echo "127.0.0.1 dev.blokmap.io" >> /etc/hosts
```

### 5. Running the project

To run the project, you need to have Docker and Docker Compose installed on your machine. Run the following command in the `deploy` repository, in the `development` folder:

```bash
docker compose up --build
```

The project will be available at [https://dev.blokmap.io](https://dev.blokmap.io):

- Frontend build files are served on [https://dev.blokmap.io](https://dev.blokmap.io) with hot reloading enabled.
- Backend API is available on [https://dev.blokmap.io/api](https://dev.blokmap.io/api) with hot reloading enabled.

## Production

