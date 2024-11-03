# Transacional Script

1. Start the application

```bash
docker compose up
```

2. Connect to the `localstack` instance:

```bash
docker compose exec localstack bash
```

3. Create the dead letter queues (DLQ - Dead-Letter Queue)

**Estoque**

```bash
# awslocal --endpoint-url=http://localhost:4566 --region us-east-1 sqs create-queue --queue-name estoque-atualizacao-dlq
awslocal sqs create-queue --queue-name estoque-atualizacao-dlq
```

response:

```json
{
    "QueueUrl": "http://sqs.us-east-1.localhost.localstack.cloud:4566/000000000000/estoque-atualizacao-dlq"
}
```

**Preço**

```bash
awslocal sqs create-queue --queue-name preco-atualizacao-dlq
```

response:

```json
{
    "QueueUrl": "http://sqs.us-east-1.localhost.localstack.cloud:4566/000000000000/preco-atualizacao-dlq"
}
```

**Produto**

```bash
awslocal sqs create-queue --queue-name produto-atualizacao-dlq
```

response:

```json
{
    "QueueUrl": "http://sqs.us-east-1.localhost.localstack.cloud:4566/000000000000/produto-atualizacao-dlq"
}
```

4. Create the queues

**Estoque**

```bash
awslocal sqs create-queue --queue-name estoque-atualizacao --attributes '{"RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:us-east-1:000000000000:estoque-atualizacao-dlq\",\"max-ReceiveCount\":3}"}'
```

```json
{
    "QueueUrl": "http://sqs.us-east-1.localhost.localstack.cloud:4566/000000000000/estoque-atualizacao"
}
```

**Preço**

```bash
awslocal sqs create-queue --queue-name preco-atualizacao --attributes '{"RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:us-east-1:000000000000:preco-atualizacao-dlq\",\"max-ReceiveCount\":3}"}'
```

```json
{
    "QueueUrl": "http://sqs.us-east-1.localhost.localstack.cloud:4566/000000000000/preco-atualizacao"
}
```

**Produto**

```bash
awslocal sqs create-queue --queue-name produto-atualizacao --attributes '{"RedrivePolicy": "{\"deadLetterTargetArn\":\"arn:aws:sqs:us-east-1:000000000000:produto-atualizacao-dlq\",\"max-ReceiveCount\":3}"}'
```

```json
{
    "QueueUrl": "http://sqs.us-east-1.localhost.localstack.cloud:4566/000000000000/produto-atualizacao"
}
```

5. Clean the database tables data

Run the postman for `Estoque`, `Precificação` and `Catálogo`.

6. Run the `Catálogo/Criar Produto`

It should be able to create the product. Double-check with `Busca Produto/Obter Produto`.

> If for some reason it was not able to run, it could be the user for localstack. You will need to create a new user and get the access-key and update at the application:

```bash
awslocal iam create-user --user-name catalogo-user
```

