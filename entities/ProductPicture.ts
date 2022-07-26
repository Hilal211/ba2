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

@Index("FK_product_04", ["productId"], {})
@Index("FK_created_by_04", ["createdBy"], {})
@Entity("product_picture", { schema: "aplo" })
export class ProductPicture {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("int", { name: "product_id", nullable: true, unsigned: true })
  productId: number | null;

  @Column("varchar", { name: "image", length: 75 })
  image: string;

  @Column("datetime", {
    name: "created_date",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdDate: Date;

  @Column("int", { name: "created_by", nullable: true, unsigned: true })
  createdBy: number | null;

  @ManyToOne(() => Login, (login) => login.productPictures, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "created_by", referencedColumnName: "id" }])
  createdBy2: Login;

  @ManyToOne(() => Product, (product) => product.productPictures, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "product_id", referencedColumnName: "id" }])
  product: Product;
}
