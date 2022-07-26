import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Category } from "./Category";
import { Store } from "./Store";
import { Login } from "./Login";
import { ProfileCategoryProduct } from "./ProfileCategoryProduct";

@Index("FK_category", ["categoryId"], {})
@Index("FK_updated_by_04", ["updatedBy"], {})
@Index("FK_store_04", ["storeId"], {})
@Entity("profile_category", { schema: "aplo" })
export class ProfileCategory {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("varchar", { name: "name", length: 50 })
  name: string;

  @Column("int", { name: "category_id", nullable: true, unsigned: true })
  categoryId: number | null;

  @Column("int", { name: "brand_id", nullable: true })
  brandId: number | null;

  @Column("int", { name: "store_id", nullable: true, unsigned: true })
  storeId: number | null;

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
    nullable: true,
    comment: "0:Not Archived, 1:Archived",
    default: () => "'0'",
  })
  archived: number | null;

  @ManyToOne(() => Category, (category) => category.profileCategories, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "category_id", referencedColumnName: "id" }])
  category: Category;

  @ManyToOne(() => Store, (store) => store.profileCategories, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "store_id", referencedColumnName: "id" }])
  store: Store;

  @ManyToOne(() => Login, (login) => login.profileCategories, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "updated_by", referencedColumnName: "id" }])
  updatedBy2: Login;

  @OneToMany(
    () => ProfileCategoryProduct,
    (profileCategoryProduct) => profileCategoryProduct.profileCategory
  )
  profileCategoryProducts: ProfileCategoryProduct[];
}
