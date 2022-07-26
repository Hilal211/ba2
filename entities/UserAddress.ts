import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Country } from "./Country";
import { State } from "./State";
import { User } from "./User";

@Index("FK_country_03", ["countryId"], {})
@Index("FK_state_02", ["stateId"], {})
@Index("FK_user_03", ["userId"], {})
@Entity("user_address", { schema: "aplo" })
export class UserAddress {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("int", { name: "user_id", nullable: true, unsigned: true })
  userId: number | null;

  @Column("int", { name: "country_id", nullable: true, unsigned: true })
  countryId: number | null;

  @Column("int", { name: "state_id", nullable: true, unsigned: true })
  stateId: number | null;

  @Column("varchar", { name: "address", length: 100 })
  address: string;

  @Column("smallint", { name: "type", comment: "1:Home, 2:Work" })
  type: number;

  @Column("datetime", {
    name: "created_date",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdDate: Date;

  @ManyToOne(() => Country, (country) => country.userAddresses, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "country_id", referencedColumnName: "id" }])
  country: Country;

  @ManyToOne(() => State, (state) => state.userAddresses, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "state_id", referencedColumnName: "id" }])
  state: State;

  @ManyToOne(() => User, (user) => user.userAddresses, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "user_id", referencedColumnName: "id" }])
  user: User;
}
