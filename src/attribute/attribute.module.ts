import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AttributeService } from './attribute.service';
import { AttributeController } from './attribute.controller';
import { Attribute } from '../../entities/Attribute';
import { LogModule } from 'src/log/log.module';

@Module({
  imports: [TypeOrmModule.forFeature([Attribute]),LogModule],
  providers: [AttributeService],
  controllers: [AttributeController],
})
export class AttributesModule {}