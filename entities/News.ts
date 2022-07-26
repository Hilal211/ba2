import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Category } from "./Category";
import { Store } from "./Store";
import { Login } from "./Login";

@Index("FK_category_04", ["categoryId"], {})
@Index("FK_updated_by_06", ["updatedBy"], {})
@Index("FK_store_02", ["storeId"], {})
@Entity("news", { schema: "aplo" })
export class News {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("varchar", { name: "title", length: 150 })
  title: string;

  @Column("varchar", { name: "summary", length: 250 })
  summary: string;

  @Column("text", { name: "text" })
  text: string;

  @Column("varchar", { name: "featured_image", length: 75 })
  featuredImage: string;

  @Column("varchar", { name: "banner_image", length: 75 })
  bannerImage: string;

  @Column("datetime", { name: "news_date" })
  newsDate: Date;

  @Column("int", { name: "category_id", nullable: true, unsigned: true })
  categoryId: number | null;

  @Column("int", { name: "store_id", nullable: true, unsigned: true })
  storeId: number | null;

  @Column("varchar", { name: "hashtags", length: 250 })
  hashtags: string;

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

  @ManyToOne(() => Category, (category) => category.news, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "category_id", referencedColumnName: "id" }])
  category: Category;

  @ManyToOne(() => Store, (store) => store.news, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "store_id", referencedColumnName: "id" }])
  store: Store;

  @ManyToOne(() => Login, (login) => login.news, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "updated_by", referencedColumnName: "id" }])
  updatedBy2: Login;
}
