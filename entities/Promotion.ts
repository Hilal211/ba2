import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Store } from "./Store";
import { Login } from "./Login";

@Index("FK_login_02", ["storeId"], {})
@Index("FK_updated_by_03", ["updatedBy"], {})
@Entity("promotion", { schema: "aplo" })
export class Promotion {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("varchar", { name: "text", length: 250 })
  text: string;

  @Column("int", { name: "store_id", nullable: true, unsigned: true })
  storeId: number | null;

  @Column("smallint", {
    name: "active",
    comment: "0:Not Active, 1:Active",
    default: () => "'1'",
  })
  active: number;

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

  @ManyToOne(() => Store, (store) => store.promotions, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "store_id", referencedColumnName: "id" }])
  store: Store;

  @ManyToOne(() => Login, (login) => login.promotions, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "updated_by", referencedColumnName: "id" }])
  updatedBy2: Login;
}
