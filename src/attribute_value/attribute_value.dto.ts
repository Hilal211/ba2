export interface AttributeValueDto {
    id: number;
    attribute_id:number;
    value: string;
    createdDate: Date;
    updatedDate: Date;
    updatedBy:number
    archived: number;
}