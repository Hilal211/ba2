import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Brand } from "./Brand";
import { Category } from "./Category";
import { Login } from "./Login";
import { ProductAttribute } from "./ProductAttribute";
import { ProductPicture } from "./ProductPicture";
import { ProductStyle } from "./ProductStyle";
import { ProductVariation } from "./ProductVariation";
import { ProfileCategoryProduct } from "./ProfileCategoryProduct";
import { Review } from "./Review";

@Index("FK_brand_03", ["brandId"], {})
@Index("FK_category_05", ["categoryId"], {})
@Index("FK_updated_by_05", ["updatedBy"], {})
@Entity("product", { schema: "aplo" })
export class Product {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("varchar", { name: "name", length: 75 })
  name: string;

  @Column("varchar", { name: "tag", length: 75 })
  tag: string;

  @Column("int", { name: "brand_id", nullable: true, unsigned: true })
  brandId: number | null;

  @Column("int", { name: "category_id", nullable: true, unsigned: true })
  categoryId: number | null;

  @Column("varchar", { name: "upid", length: 20 })
  upid: string;

  @Column("varchar", { name: "barcode", length: 20 })
  barcode: string;

  @Column("varchar", { name: "featured_image", length: 75 })
  featuredImage: string;

  @Column("smallint", { name: "rate", nullable: true })
  rate: number | null;

  @Column("int", { name: "nb_reviews", nullable: true, unsigned: true })
  nbReviews: number | null;

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
    name: "status",
    comment: "0:Not Active, 1:Active, 2:Requested",
  })
  status: number;

  @Column("smallint", {
    name: "archived",
    comment: "0:Not Archived, 1:Archived",
    default: () => "'0'",
  })
  archived: number;

  @ManyToOne(() => Brand, (brand) => brand.products, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "brand_id", referencedColumnName: "id" }])
  brand: Brand;

  @ManyToOne(() => Category, (category) => category.products, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "category_id", referencedColumnName: "id" }])
  category: Category;

  @ManyToOne(() => Login, (login) => login.products, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "updated_by", referencedColumnName: "id" }])
  updatedBy2: Login;

  @OneToMany(
    () => ProductAttribute,
    (productAttribute) => productAttribute.product
  )
  productAttributes: ProductAttribute[];

  @OneToMany(() => ProductPicture, (productPicture) => productPicture.product)
  productPictures: ProductPicture[];

  @OneToMany(() => ProductStyle, (productStyle) => productStyle.product)
  productStyles: ProductStyle[];

  @OneToMany(
    () => ProductVariation,
    (productVariation) => productVariation.product
  )
  productVariations: ProductVariation[];

  @OneToMany(
    () => ProfileCategoryProduct,
    (profileCategoryProduct) => profileCategoryProduct.product
  )
  profileCategoryProducts: ProfileCategoryProduct[];

  @OneToMany(() => Review, (review) => review.product)
  reviews: Review[];
}
