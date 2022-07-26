import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Event } from "./Event";
import { News } from "./News";
import { ProfileCategory } from "./ProfileCategory";
import { Promotion } from "./Promotion";
import { Activity } from "./Activity";
import { Brand } from "./Brand";
import { Login } from "./Login";

@Index("FK_brand_02", ["brandId"], {})
@Index("FK_activity_02", ["activityId"], {})
@Index("FK_login", ["loginId"], {})
@Index("FK_updated_by_02", ["updatedBy"], {})
@Entity("store", { schema: "aplo" })
export class Store {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("varchar", { name: "name", length: 75 })
  name: string;

  @Column("int", { name: "brand_id", nullable: true, unsigned: true })
  brandId: number | null;

  @Column("int", { name: "activity_id", nullable: true, unsigned: true })
  activityId: number | null;

  @Column("varchar", { name: "website", length: 150 })
  website: string;

  @Column("varchar", { name: "full_name", length: 100 })
  fullName: string;

  @Column("varchar", { name: "position", length: 75 })
  position: string;

  @Column("int", { name: "login_id", nullable: true, unsigned: true })
  loginId: number | null;

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
    comment: "0:Not Active, 1:Active",
    default: () => "'1'",
  })
  status: number;

  @Column("smallint", {
    name: "archived",
    comment: "0:Not Archived, 1:Archived",
  })
  archived: number;

  @OneToMany(() => Event, (event) => event.store)
  events: Event[];

  @OneToMany(() => News, (news) => news.store)
  news: News[];

  @OneToMany(() => ProfileCategory, (profileCategory) => profileCategory.store)
  profileCategories: ProfileCategory[];

  @OneToMany(() => Promotion, (promotion) => promotion.store)
  promotions: Promotion[];

  @ManyToOne(() => Activity, (activity) => activity.stores, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "activity_id", referencedColumnName: "id" }])
  activity: Activity;

  @ManyToOne(() => Brand, (brand) => brand.stores, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "brand_id", referencedColumnName: "id" }])
  brand: Brand;

  @ManyToOne(() => Login, (login) => login.stores, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "login_id", referencedColumnName: "id" }])
  login: Login;

  @ManyToOne(() => Login, (login) => login.stores2, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "updated_by", referencedColumnName: "id" }])
  updatedBy2: Login;
}
