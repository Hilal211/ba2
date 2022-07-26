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
import { AttributeValue } from "./AttributeValue";
import { ProductAttributePicture } from "./ProductAttributePicture";

@Index("FK_product_03", ["productId"], {})
@Index("FK_attribute", ["attributeId"], {})
@Index("FK_value", ["valueId"], {})
@Index("FK_updated_by_15", ["updatedBy"], {})
@Entity("product_attribute", { schema: "aplo" })
export class ProductAttribute {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("int", { name: "product_id", nullable: true, unsigned: true })
  productId: number | null;

  @Column("int", { name: "attribute_id", nullable: true, unsigned: true })
  attributeId: number | null;

  @Column("int", { name: "value_id", nullable: true, unsigned: true })
  valueId: number | null;

  @Column("varchar", {
    name: "value",
    comment: "In case of Information Attributes",
    length: 75,
  })
  value: string;

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
    () => ProductAttribute,
    (productAttribute) => productAttribute.productAttributes,
    { onDelete: "SET NULL", onUpdate: "SET NULL" }
  )
  @JoinColumn([{ name: "attribute_id", referencedColumnName: "id" }])
  attribute: ProductAttribute;

  @OneToMany(
    () => ProductAttribute,
    (productAttribute) => productAttribute.attribute
  )
  productAttributes: ProductAttribute[];

  @ManyToOne(() => Product, (product) => product.productAttributes, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "product_id", referencedColumnName: "id" }])
  product: Product;

  @ManyToOne(() => Login, (login) => login.productAttributes, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "updated_by", referencedColumnName: "id" }])
  updatedBy2: Login;

  @ManyToOne(
    () => AttributeValue,
    (attributeValue) => attributeValue.productAttributes,
    { onDelete: "SET NULL", onUpdate: "SET NULL" }
  )
  @JoinColumn([{ name: "value_id", referencedColumnName: "id" }])
  value_2: AttributeValue;

  @OneToMany(
    () => ProductAttributePicture,
    (productAttributePicture) => productAttributePicture.productAttribute
  )
  productAttributePictures: ProductAttributePicture[];
}
