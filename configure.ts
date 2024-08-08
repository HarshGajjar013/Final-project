import { DataSource } from "typeorm";
import { Book } from "./Book";
import { Author } from "./Author";
import { Publisher } from "./Publisher";
import { Customer } from "./Customer";
import { Review } from "./Review";
import { Sale } from "./Sale";

export const postgresDataSource = new DataSource({
  type: "postgres",
  host: 'localhost',
  port: 5432,
  username: 'postgres',
  password: 'password',
  database: 'ns_db',
  entities: [Book, Author, Publisher, Customer, Review, Sale],
  synchronize: true,
  logging: false,
});
