# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| profile         | string | null: false |

- has_many :rooms
- has_many :messages
- has_many :posts
- has_many :comments


## rooms テーブル

| Column             | Type           | Options           |
| ------------------ | -------------- | ----------------- |
| title              | string         | null: false       |
| user               | reference      | foreign_key: true |

- belongs_to :user
- has_many   :messages

## messages テーブル

| Column   | Type       | options           |
| -------- | ---------- | ----------------- |
| text     | string     | null: false       |
| user     | references | foreign_key: true |
| room     | references | foreign_key: true |

- belongs_to :user
- belongs_to :room


## posts テーブル

| Column | Type       | options           |
| ------ | ---------- | ----------------- |
| text   | string     | null: false       |
| user   | references | foreign_key: true |

- belongs_to :user
- has_many   :comments

## comments テーブル

| Column | Type         | options           |
| -------| ------------ | ----------------- |
| text   | string       | null: false       |
| user   | reference    | foreign_key: true |

- belongs_to :post


## horses テーブル

| Column   | Type         | options     |
| -------- | ------------ | ----------- |
| name     | string       | null: false |
| gender   | string       | null: false |
| birthday | string       | null: false |
| father   | string       | null: false |
| mother   | string       | null: false |

- belongs_to :race


## races テーブル

| Column   | Type         | options     |
| -------- | ------------ | ----------- |
| title    | string       | null: false |
| horse1   | string       |             |
| horse2   | string       |             |
| horse3   | string       |             |
| horse4   | string       |             |
| horse5   | string       |             |
| horse6   | string       |             |
| horse7   | string       |             |
| horse8   | string       |             |
| horse9   | string       |             |
| horse10  | string       |             |
| horse11  | string       |             |
| horse12  | string       |             |
| horse13  | string       |             |
| horse14  | string       |             |
| horse15  | string       |             |
| horse16  | string       |             |
| horse17  | string       |             |
| horse18  | string       |             |

has_many   :horses
has_one    :rap

## raps テーブル
| Column   | Type         | options           |
| -------- | ------------ | ----------------- |
| race     | references   | foreign_key: true |
| 200m     | string       |                   |
| 400m     | string       |                   |
| 600m     | string       |                   |
| 800m     | string       |                   |
| 1000m    | string       |                   |
| 1200m    | string       |                   |
| 1400m    | string       |                   |
| 1600m    | string       |                   |
| 1800m    | string       |                   |
| 2000m    | string       |                   |
| 2400m    | string       |                   |
| 2600m    | string       |                   |
| 2800m    | string       |                   |
| 3000m    | string       |                   |

belongs_to :race