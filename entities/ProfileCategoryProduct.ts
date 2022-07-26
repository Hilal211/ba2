import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Login } from "./Login";
import { ProfileCategory } from "./ProfileCategory";
import { Product } from "./Product";

@Index("FK_profile_category", ["profileCategoryId"], {})
@Index("product_id", ["productId"], {})
@Index("FK_created_by_05", ["createdBy"], {})
@Entity("profile_category_product", { schema: "aplo" })
export class ProfileCategoryProduct {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("int", {
    name: "profile_category_id",
    nullable: true,
    unsigned: true,
  })
  profileCategoryId: number | null;

  @Column("int", { name: "product_id", nullable: true, unsigned: true })
  productId: number | null;

  @Column("datetime", {
    name: "created_date",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdDate: Date;

  @Column("int", { name: "created_by", nullable: true, unsigned: true })
  createdBy: number | null;

  @ManyToOne(() => Login, (login) => login.profileCategoryProducts, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "created_by", referencedColumnName: "id" }])
  createdBy2: Login;

  @ManyToOne(
    () => ProfileCategory,
    (profileCategory) => profileCategory.profileCategoryProducts,
    { onDelete: "SET NULL", onUpdate: "SET NULL" }
  )
  @JoinColumn([{ name: "profile_category_id", referencedColumnName: "id" }])
  profileCategory: ProfileCategory;

  @ManyToOne(() => Product, (product) => product.profileCategoryProducts, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "product_id", referencedColumnName: "id" }])
  product: Product;
}
