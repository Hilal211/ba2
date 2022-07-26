import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Login } from "./Login";

@Index("FK_login_04", ["loginId"], {})
@Entity("log", { schema: "aplo" })
export class Log {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("int", { name: "login_id", nullable: true, unsigned: true })
  loginId: number | null;

  @Column("varchar", { name: "file", length: 150 })
  file: string;

  @Column("text", { name: "extra" })
  extra: string;

  @Column("varchar", { name: "error", length: 500 })
  error: string;

  @Column("datetime", {
    name: "created_date",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdDate: Date;

  @ManyToOne(() => Login, (login) => login.logs, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "login_id", referencedColumnName: "id" }])
  login: Login;
}
