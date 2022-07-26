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

@Index("FK_product_02", ["productId"], {})
@Index("FK_created_by_02", ["createdBy"], {})
@Entity("product_style", { schema: "aplo" })
export class ProductStyle {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("int", { name: "product_id", nullable: true, unsigned: true })
  productId: number | null;

  @Column("int", { name: "style_id", unsigned: true })
  styleId: number;

  @Column("datetime", {
    name: "created_date",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdDate: Date;

  @Column("int", { name: "created_by", nullable: true, unsigned: true })
  createdBy: number | null;

  @ManyToOne(() => Login, (login) => login.productStyles, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "created_by", referencedColumnName: "id" }])
  createdBy2: Login;

  @ManyToOne(() => Product, (product) => product.productStyles, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "product_id", referencedColumnName: "id" }])
  product: Product;
}
