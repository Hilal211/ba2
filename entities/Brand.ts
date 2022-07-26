import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from "typeorm";
import { Login } from "./Login";
import { BusinessRequest } from "./BusinessRequest";
import { Product } from "./Product";
import { Store } from "./Store";

@Index("FK_updated_by_08", ["updatedBy"], {})
@Entity("brand", { schema: "aplo" })
export class Brand {
  @PrimaryGeneratedColumn({ type: "int", name: "id", unsigned: true })
  id: number;

  @Column("varchar", { name: "name", length: 50 })
  name: string;

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
    comment: "0:Not Archived, 1:Archived\t",
    default: () => "'0'",
  })
  archived: number;

  @ManyToOne(() => Login, (login) => login.brands, {
    onDelete: "SET NULL",
    onUpdate: "SET NULL",
  })
  @JoinColumn([{ name: "updated_by", referencedColumnName: "id" }])
  updatedBy2: Login;

  @OneToMany(() => BusinessRequest, (businessRequest) => businessRequest.brand)
  businessRequests: BusinessRequest[];

  @OneToMany(() => Product, (product) => product.brand)
  products: Product[];

  @OneToMany(() => Store, (store) => store.brand)
  stores: Store[];
}
