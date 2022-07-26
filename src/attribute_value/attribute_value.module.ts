import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AttributeValueService } from './attribute_value.service';
import { AttributeValueController } from './attribute_value.controller';
import { AttributeValue } from '../../entities/AttributeValue';
import { LogModule } from 'src/log/log.module';

@Module({
  imports: [TypeOrmModule.forFeature([AttributeValue]),LogModule],
  providers: [AttributeValueService],
  controllers: [AttributeValueController],
})
export class AttributeValueModule {}