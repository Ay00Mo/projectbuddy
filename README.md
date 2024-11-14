# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| last_name          | string | null: false |
| first_name         | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| pin_number         | integer| null: false |
| usr_type           | integer| null: false |

### Association

- has_many :cases


## cases テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| reference_number   | string | null: false |
| application_number | string | null: false |
| country_code       | string | null: false |
| law_category_id    | integer| null: false |
| category_id        | integer| null: false |
| status_id          | integer| null: false |
| beginning_date     | date   | null: false |
| deadline           | date   | null: false |
| absolute_deadline  | date   | null: false |
| request_date       | date   |             |
| delivery_date      | date   |             |
| response_date      | date   |             |
| instruction_date   | date   |             |
| filing_date        | date   |             |
| remarks            | text   |             |
| user               | references | null: false, foreign_key: true |
| internal_contact   | references | null: false, foreign_key: { to_table: :users } |

### Association

- belongs_to :law_category
- belongs_to :category
- belongs_to :status
- belongs_to :user
- has_many :case_contacts
- has_many :contacts, through: :case_contacts
- has_many :case_attorney_firms
- has_many :attorney_firms, through: :case_attorneys_firms
- has_many :case_procedures
- has_many :procedures, through: :case_procedures
- has_many :case_applicants
- has_many :applicants, through: :case_applicants


## contacts テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| last_name_jp       | string | null: false |
| first_name_jp      | string | null: false |
| last_name_en       | string | null: false |
| first_name_en      | string | null: false |

### Association

- has_many :case_contacts
- has_many :cases, through: :case_contacts


## case_contacts テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| case    | references | null: false, foreign_key: true |
| contact | references | null: false, foreign_key: true |

### Association

- belongs_to :case
- belongs_to :contact


## attorney_firms テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| firm_name      | string | null: false |

### Association

- has_many :case_attorney_firms
- has_many :cases, through: :case_attorney_firms


## case_attorney_firms テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| case           | references | null: false, foreign_key: true |
| attorney_firm  | references | null: false, foreign_key: true |

### Association

- belongs_to :case
- belongs_to :attorney_firm


## applicants テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| applicant_name      | string | null: false |

### Association

- has_many :case_applicants
- has_many :cases, through: :case_applicants


## case_applicants テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| case      | references | null: false, foreign_key: true |
| applicant | references | null: false, foreign_key: true |

### Association

- belongs_to :case
- belongs_to :applicant


## procedures テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| procedure_name      | string | null: false |

### Association
- has_many :case_procedures
- has_many :cases, through: :case_procedures


## case_procedures テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| case      | references | null: false, foreign_key: true |
| procedure | references | null: false, foreign_key: true |

### Association
- belongs_to :case
- belongs_to :procedure