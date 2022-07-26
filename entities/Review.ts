import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Login } from "./Login";
import { Product } from "./Product";

@Index("FK_created_by", ["createdBy"], {})
@Index("FK_product", ["productId"], {})
@Entity("review", { schema: "aplo" })
export class Review {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("int", { name: "product_id", nullable: true, unsigned: true })
  productId: number | null;

  @Column("varchar", { name: "text", length: 500 })
  text: string;

  @Column("smallint", { name: "rate", comment: "From 1 to 5" })
  rate: number;

  @Column("datetime", {
    name: "created_date",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdDate: Date;

  @Column("int", { name: "created_by", nullable: true, unsigned: true })
  createdBy: number | null;

  @ManyToOne(() => Login, (login) => login.reviews, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "created_by", referencedColumnName: "id" }])
  createdBy2: Login;

  @ManyToOne(() => Product, (product) => product.reviews, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "product_id", referencedColumnName: "id" }])
  product: Product;
}
