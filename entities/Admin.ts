import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Login } from "./Login";

@Index("FK_login_03", ["loginId"], {})
@Index("FK_updated_by_09", ["updatedBy"], {})
@Entity("admin", { schema: "aplo" })
export class Admin {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("int", { name: "login_id", nullable: true, unsigned: true })
  loginId: number | null;

  @Column("varchar", { name: "first_name", length: 50 })
  firstName: string;

  @Column("varchar", { name: "last_name", length: 50 })
  lastName: string;

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

  @ManyToOne(() => Login, (login) => login.admins, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "login_id", referencedColumnName: "id" }])
  login: Login;

  @ManyToOne(() => Login, (login) => login.admins2, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "updated_by", referencedColumnName: "id" }])
  updatedBy2: Login;
}
