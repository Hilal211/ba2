import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { State } from "./State";
import { User } from "./User";
import { UserAddress } from "./UserAddress";

@Entity("country", { schema: "aplo" })
export class Country {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("varchar", { name: "name", length: 75 })
  name: string;

  @Column("varchar", { name: "sortname", length: 3 })
  sortname: string;

  @OneToMany(() => State, (state) => state.country)
  states: State[];

  @OneToMany(() => User, (user) => user.country)
  users: User[];

  @OneToMany(() => User, (user) => user.nationality)
  users2: User[];

  @OneToMany(() => UserAddress, (userAddress) => userAddress.country)
  userAddresses: UserAddress[];
}
