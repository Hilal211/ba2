import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Style } from "./Style";
import { User } from "./User";

@Index("FK_user_05", ["userId"], {})
@Index("FK_style", ["styleId"], {})
@Entity("user_style", { schema: "aplo" })
export class UserStyle {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("int", { name: "user_id", nullable: true, unsigned: true })
  userId: number | null;

  @Column("int", { name: "style_id", nullable: true, unsigned: true })
  styleId: number | null;

  @Column("datetime", {
    name: "created_date",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdDate: Date;

  @ManyToOne(() => Style, (style) => style.userStyles, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "style_id", referencedColumnName: "id" }])
  style: Style;

  @ManyToOne(() => User, (user) => user.userStyles, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "user_id", referencedColumnName: "id" }])
  user: User;
}
