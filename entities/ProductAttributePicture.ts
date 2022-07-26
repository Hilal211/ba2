import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Login } from "./Login";
import { ProductAttribute } from "./ProductAttribute";

@Index("FK_product_attribute", ["productAttributeId"], {})
@Index("FK_created_by_03", ["createdBy"], {})
@Entity("product_attribute_picture", { schema: "aplo" })
export class ProductAttributePicture {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("int", {
    name: "product_attribute_id",
    nullable: true,
    unsigned: true,
  })
  productAttributeId: number | null;

  @Column("varchar", { name: "image", length: 75 })
  image: string;

  @Column("smallint", {
    name: "default",
    comment: "0:Not Default, 1:Default",
    default: () => "'0'",
  })
  default: number;

  @Column("datetime", {
    name: "created_date",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdDate: Date;

  @Column("int", { name: "created_by", nullable: true, unsigned: true })
  createdBy: number | null;

  @ManyToOne(() => Login, (login) => login.productAttributePictures, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "created_by", referencedColumnName: "id" }])
  createdBy2: Login;

  @ManyToOne(
    () => ProductAttribute,
    (productAttribute) => productAttribute.productAttributePictures,
    { onDelete: "SET NULL", onUpdate: "SET NULL" }
  )
  @JoinColumn([{ name: "product_attribute_id", referencedColumnName: "id" }])
  productAttribute: ProductAttribute;
}
