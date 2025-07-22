## Структура файлів

- [main.tf](main.tf)
- [outputs.tf](outputs.tf)
- [provider.tf](provider.tf)
- [terraform.tfvars](terraform.tfvars)
- [variables.tf](variables.tf)
-- [modules/ec2/main.tf](modules/ec2/main.tf)
-- [modules/ec2/outputs.tf](modules/ec2/outputs.tf)
-- [modules/ec2/variables.tf](modules/ec2/variables.tf)
-- [modules/subnets/main.tf](modules/subnets/main.tf)
-- [modules/subnets/outputs.tf](modules/subnets/outputs.tf)
-- [modules/subnets/variables.tf](modules/subnets/variables.tf)
-- [modules/vpc/main.tf](modules/vpc/main.tf)
-- [modules/vpc/outputs.tf](modules/vpc/outputs.tf)
-- [modules/vpc/variables.tf](modules/vpc/variables.tf)
+ додатково створення eks
-- [modules/eks/main.tf](modules/eks/main.tf)
-- [modules/eks/outputs.tf](modules/eks/outputs.tf)
-- [modules/eks/variables.tf](modules/eks/variables.tf)
+ імпорт бакета
-- [manual_s3.tf](manual_s3.tf)

основні файли + модулі + модулі для дод завдань + імпорт бакета.

## Імпорт S3 Bucket

1. Бакет `devops-manual-bucket` було створено вручну через AWS Console.
2. Додано Terraform ресурс у [manual_s3.tf](manual_s3.tf).
3. Імпорт виконано командою:

```bash
terraform import aws_s3_bucket.manual devops-manual-bucket
```

Потім перевірили через terraform plan

Були проблеми з підключенням по ссш але виправив додаванням свого ІП в групу доступу. 

Потім все вичистили через terraform дестрой та перевірку
