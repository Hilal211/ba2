import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { ProductVariation } from "./ProductVariation";
import { Login } from "./Login";

@Index("FK_product_variation", ["productVariationId"], {})
@Index("FK_updated_by_17", ["updatedBy"], {})
@Entity("store_product", { schema: "aplo" })
export class StoreProduct {
  @PrimaryGeneratedColumn({ type: "int", name: "id" })
  id: number;

  @Column("int", {
    name: "product_variation_id",
    nullable: true,
    unsigned: true,
  })
  productVariationId: number | null;

  @Column("int", { name: "qty" })
  qty: number;

  @Column("float", { name: "price", precision: 12 })
  price: number;

  @Column("datetime", {
    name: "created_date",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdDate: Date;

  @Column("datetime", {
    name: "updated_date",
    default: () => "CURRENT_TIMESTAMP",
  })
  updatedDate: Date;

  @Column("int", { name: "updated_by", nullable: true, unsigned: true })
  updatedBy: number | null;

  @Column("smallint", {
    name: "archived",
    comment: "0:Not Archived, 1:Archived",
    default: () => "'0'",
  })
  archived: number;

  @ManyToOne(
    () => ProductVariation,
    (productVariation) => productVariation.storeProducts,
    { onDelete: "RESTRICT", onUpdate: "RESTRICT" }
  )
  @JoinColumn([{ name: "product_variation_id", referencedColumnName: "id" }])
  productVariation: ProductVariation;

  @ManyToOne(() => Login, (login) => login.storeProducts, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "updated_by", referencedColumnName: "id" }])
  updatedBy2: Login;
}
