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

@Index("FK_updated_by_13", ["updatedBy"], {})
@Index("FK_store", ["storeId"], {})
@Entity("event", { schema: "aplo" })
export class Event {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("varchar", { name: "title", length: 150 })
  title: string;

  @Column("varchar", { name: "text", length: 500 })
  text: string;

  @Column("int", { name: "store_id", nullable: true, unsigned: true })
  storeId: number | null;

  @Column("varchar", { name: "link", length: 150 })
  link: string;

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

  @ManyToOne(() => Store, (store) => store.events, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "store_id", referencedColumnName: "id" }])
  store: Store;

  @ManyToOne(() => Login, (login) => login.events, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "updated_by", referencedColumnName: "id" }])
  updatedBy2: Login;
}
