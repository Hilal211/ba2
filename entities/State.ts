import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Country } from "./Country";
import { User } from "./User";
import { UserAddress } from "./UserAddress";

@Index("FK_country", ["countryId"], {})
@Entity("state", { schema: "aplo" })
export class State {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("varchar", { name: "name", length: 75 })
  name: string;

  @Column("int", {
    name: "country_id",
    nullable: true,
    unsigned: true,
    default: () => "'1'",
  })
  countryId: number | null;

  @ManyToOne(() => Country, (country) => country.states, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "country_id", referencedColumnName: "id" }])
  country: Country;

  @OneToMany(() => User, (user) => user.state)
  users: User[];

  @OneToMany(() => UserAddress, (userAddress) => userAddress.state)
  userAddresses: UserAddress[];
}
