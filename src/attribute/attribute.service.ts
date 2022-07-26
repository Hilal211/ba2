import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Not, Repository,IsNull } from 'typeorm';
import { Attribute } from '../../entities/Attribute';
import { AttributeDto } from './attribute.dto';
@Injectable()
export class AttributeService {

  constructor(
    @InjectRepository(Attribute)
    private attributeRepository: Repository<Attribute>,
  ) { }
  async findAll() {
    return await this.attributeRepository.find({relations: ['attributeValues']});
  }

}