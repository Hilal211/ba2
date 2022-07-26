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
import { Login } from "./Login";
import { State } from "./State";
import { UserAddress } from "./UserAddress";
import { UserDates } from "./UserDates";
import { UserEmail } from "./UserEmail";
import { UserSocialMedia } from "./UserSocialMedia";
import { UserStyle } from "./UserStyle";

@Index("FK_login_02", ["loginId"], {})
@Index("FK_nationality", ["nationalityId"], {})
@Index("FK_country_02", ["countryId"], {})
@Index("FK_state", ["stateId"], {})
@Entity("user", { schema: "aplo" })
export class User {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("int", { name: "login_id", nullable: true, unsigned: true })
  loginId: number | null;

  @Column("varchar", { name: "first_name", length: 50 })
  firstName: string;

  @Column("varchar", { name: "last_name", length: 50 })
  lastName: string;

  @Column("varchar", { name: "mobile", length: 20 })
  mobile: string;

  @Column("smallint", {
    name: "gender",
    nullable: true,
    comment: "1:Male, 2:Female",
  })
  gender: number | null;

  @Column("date", { name: "birthday" })
  birthday: string;

  @Column("int", { name: "nationality_id", nullable: true, unsigned: true })
  nationalityId: number | null;

  @Column("int", { name: "country_id", nullable: true, unsigned: true })
  countryId: number | null;

  @Column("int", { name: "state_id", nullable: true, unsigned: true })
  stateId: number | null;

  @Column("varchar", { name: "profile_image", length: 75 })
  profileImage: string;

  @Column("datetime", {
    name: "created_date",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdDate: Date;

  @ManyToOne(() => Country, (country) => country.users, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "country_id", referencedColumnName: "id" }])
  country: Country;

  @ManyToOne(() => Login, (login) => login.users, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "login_id", referencedColumnName: "id" }])
  login: Login;

  @ManyToOne(() => Country, (country) => country.users2, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "nationality_id", referencedColumnName: "id" }])
  nationality: Country;

  @ManyToOne(() => State, (state) => state.users, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "state_id", referencedColumnName: "id" }])
  state: State;

  @OneToMany(() => UserAddress, (userAddress) => userAddress.user)
  userAddresses: UserAddress[];

  @OneToMany(() => UserDates, (userDates) => userDates.user)
  userDates: UserDates[];

  @OneToMany(() => UserEmail, (userEmail) => userEmail.user)
  userEmails: UserEmail[];

  @OneToMany(() => UserSocialMedia, (userSocialMedia) => userSocialMedia.user)
  userSocialMedias: UserSocialMedia[];

  @OneToMany(() => UserStyle, (userStyle) => userStyle.user)
  userStyles: UserStyle[];
}
