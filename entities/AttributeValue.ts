import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Attribute } from "./Attribute";
import { ProductAttribute } from "./ProductAttribute";

@Index("attribute_id", ["attributeId"], {})
@Entity("attribute_value", { schema: "aplo" })
export class AttributeValue {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("int", { name: "attribute_id", nullable: true, unsigned: true })
  attributeId: number | null;

  @Column("varchar", { name: "value", length: 50 })
  value: string;

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

  @ManyToOne(() => Attribute, (attribute) => attribute.attributeValues, {
    onDelete: "RESTRICT",
    onUpdate: "RESTRICT",
  })
  @JoinColumn([{ name: "attribute_id", referencedColumnName: "id" }])
  attribute: Attribute;

  @OneToMany(
    () => ProductAttribute,
    (productAttribute) => productAttribute.value_2
  )
  productAttributes: ProductAttribute[];
}
