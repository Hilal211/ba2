import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { Activity } from "./Activity";
import { Admin } from "./Admin";
import { Attribute } from "./Attribute";
import { Brand } from "./Brand";
import { Category } from "./Category";
import { Content } from "./Content";
import { Event } from "./Event";
import { Log } from "./Log";
import { News } from "./News";
import { Product } from "./Product";
import { ProductAttribute } from "./ProductAttribute";
import { ProductAttributePicture } from "./ProductAttributePicture";
import { ProductPicture } from "./ProductPicture";
import { ProductStyle } from "./ProductStyle";
import { ProductVariation } from "./ProductVariation";
import { ProfileCategory } from "./ProfileCategory";
import { ProfileCategoryProduct } from "./ProfileCategoryProduct";
import { Promotion } from "./Promotion";
import { Review } from "./Review";
import { Store } from "./Store";
import { StoreProduct } from "./StoreProduct";
import { Style } from "./Style";
import { User } from "./User";

@Entity("login", { schema: "aplo" })
export class Login {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("varchar", { name: "email", length: 75 })
  email: string;

  @Column("varchar", { name: "password", nullable: true, length: 60 })
  password: string | null;

  @Column("smallint", { name: "type", comment: "1:user, 2:store, 3:admin" })
  type: number;

  @Column("varchar", { name: "verification_token", length: 60 })
  verificationToken: string;

  @Column("varchar", { name: "password_reset_token", length: 60 })
  passwordResetToken: string;

  @Column("smallint", {
    name: "social_type",
    comment: "0:None, 1:Apple, 2:Gmail, 3:Facebook",
    default: () => "'0'",
  })
  socialType: number;

  @Column("varchar", { name: "social_token", length: 60 })
  socialToken: string;

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

  @Column("smallint", {
    name: "archived",
    comment: "0:Not Archived, 1:Archived",
    default: () => "'0'",
  })
  archived: number;

  @OneToMany(() => Activity, (activity) => activity.updatedBy2)
  activities: Activity[];

  @OneToMany(() => Admin, (admin) => admin.login)
  admins: Admin[];

  @OneToMany(() => Admin, (admin) => admin.updatedBy2)
  admins2: Admin[];

  @OneToMany(() => Attribute, (attribute) => attribute.updatedBy2)
  attributes: Attribute[];

  @OneToMany(() => Brand, (brand) => brand.updatedBy2)
  brands: Brand[];

  @OneToMany(() => Category, (category) => category.updatedBy2)
  categories: Category[];

  @OneToMany(() => Content, (content) => content.updatedBy2)
  contents: Content[];

  @OneToMany(() => Event, (event) => event.updatedBy2)
  events: Event[];

  @OneToMany(() => Log, (log) => log.login)
  logs: Log[];

  @OneToMany(() => News, (news) => news.updatedBy2)
  news: News[];

  @OneToMany(() => Product, (product) => product.updatedBy2)
  products: Product[];

  @OneToMany(
    () => ProductAttribute,
    (productAttribute) => productAttribute.updatedBy2
  )
  productAttributes: ProductAttribute[];

  @OneToMany(
    () => ProductAttributePicture,
    (productAttributePicture) => productAttributePicture.createdBy2
  )
  productAttributePictures: ProductAttributePicture[];

  @OneToMany(
    () => ProductPicture,
    (productPicture) => productPicture.createdBy2
  )
  productPictures: ProductPicture[];

  @OneToMany(() => ProductStyle, (productStyle) => productStyle.createdBy2)
  productStyles: ProductStyle[];

  @OneToMany(
    () => ProductVariation,
    (productVariation) => productVariation.updatedBy2
  )
  productVariations: ProductVariation[];

  @OneToMany(
    () => ProfileCategory,
    (profileCategory) => profileCategory.updatedBy2
  )
  profileCategories: ProfileCategory[];

  @OneToMany(
    () => ProfileCategoryProduct,
    (profileCategoryProduct) => profileCategoryProduct.createdBy2
  )
  profileCategoryProducts: ProfileCategoryProduct[];

  @OneToMany(() => Promotion, (promotion) => promotion.updatedBy2)
  promotions: Promotion[];

  @OneToMany(() => Review, (review) => review.createdBy2)
  reviews: Review[];

  @OneToMany(() => Store, (store) => store.login)
  stores: Store[];

  @OneToMany(() => Store, (store) => store.updatedBy2)
  stores2: Store[];

  @OneToMany(() => StoreProduct, (storeProduct) => storeProduct.updatedBy2)
  storeProducts: StoreProduct[];

  @OneToMany(() => Style, (style) => style.updatedBy2)
  styles: Style[];

  @OneToMany(() => User, (user) => user.login)
  users: User[];
}
