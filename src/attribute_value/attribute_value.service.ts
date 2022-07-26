import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Not, Repository,IsNull } from 'typeorm';
import { AttributeValue } from '../../entities/AttributeValue';
import { AttributeValueDto } from './attribute_value.dto';
@Injectable()
export class AttributeValueService {

  constructor(
    @InjectRepository(AttributeValue)
    private attributeValueRepository: Repository<AttributeValue>,
  ) { }
  async findAllWithAttribute() {
    return await this.attributeValueRepository.find({relations: ['attribute']});
  }

}