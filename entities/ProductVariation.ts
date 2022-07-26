import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Product } from "./Product";
import { Login } from "./Login";
import { StoreProduct } from "./StoreProduct";

@Index("FK_product_05", ["productId"], {})
@Index("FK_updated_by_16", ["updatedBy"], {})
@Entity("product_variation", { schema: "aplo" })
export class ProductVariation {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("int", { name: "product_id", nullable: true, unsigned: true })
  productId: number | null;

  @Column("json", {
    name: "variation",
    comment: "{barcode:949403403, color:Graphite, capacity:265 GB}",
  })
  variation: object;

  @Column("datetime", { name: "created_date" })
  createdDate: Date;

  @Column("int", { name: "updated_date", unsigned: true })
  updatedDate: number;

  @Column("int", { name: "updated_by", nullable: true, unsigned: true })
  updatedBy: number | null;

  @Column("smallint", {
    name: "archived",
    comment: "0:Not Archived, 1:Archived",
    default: () => "'0'",
  })
  archived: number;

  @ManyToOne(() => Product, (product) => product.productVariations, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "product_id", referencedColumnName: "id" }])
  product: Product;

  @ManyToOne(() => Login, (login) => login.productVariations, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "updated_by", referencedColumnName: "id" }])
  updatedBy2: Login;

  @OneToMany(
    () => StoreProduct,
    (storeProduct) => storeProduct.productVariation
  )
  storeProducts: StoreProduct[];
}
