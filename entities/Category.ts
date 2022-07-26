import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Login } from "./Login";
import { News } from "./News";
import { Product } from "./Product";
import { ProfileCategory } from "./ProfileCategory";
import { Style } from "./Style";

@Index("FK_updated_by_07", ["updatedBy"], {})
@Index("parent_id", ["parentId"], {})
@Entity("category", { schema: "aplo" })
export class Category {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("varchar", { name: "name", length: 50 })
  name: string;

  @Column("int", { name: "parent_id", nullable: true, unsigned: true })
  parentId: number | null;

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

  @ManyToOne(() => Login, (login) => login.categories, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "updated_by", referencedColumnName: "id" }])
  updatedBy2: Login;

  @ManyToOne(() => Category, (category) => category.categories, {
    onDelete: "RESTRICT",
    onUpdate: "RESTRICT",
  })
  @JoinColumn([{ name: "parent_id", referencedColumnName: "id" }])
  parent: Category;

  @OneToMany(() => Category, (category) => category.parent)
  categories: Category[];

  @OneToMany(() => News, (news) => news.category)
  news: News[];

  @OneToMany(() => Product, (product) => product.category)
  products: Product[];

  @OneToMany(
    () => ProfileCategory,
    (profileCategory) => profileCategory.category
  )
  profileCategories: ProfileCategory[];

  @OneToMany(() => Style, (style) => style.category)
  styles: Style[];
}
