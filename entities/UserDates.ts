import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { User } from "./User";

@Index("FK_user_04", ["userId"], {})
@Entity("user_dates", { schema: "aplo" })
export class UserDates {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("int", { name: "user_id", nullable: true, unsigned: true })
  userId: number | null;

  @Column("varchar", { name: "date_name", length: 50 })
  dateName: string;

  @Column("smallint", {
    name: "type",
    comment: "1:Nameday, 2:Anniversary, 3:Other",
  })
  type: number;

  @Column("smallint", { name: "month" })
  month: number;

  @Column("smallint", { name: "day" })
  day: number;

  @Column("datetime", { name: "created_date" })
  createdDate: Date;

  @ManyToOne(() => User, (user) => user.userDates, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "user_id", referencedColumnName: "id" }])
  user: User;
}
