import {
  Body,
  Controller,
  Delete,
  Get,
  HttpException,
  HttpStatus,
  Param,
  Patch,
  Post,
  UploadedFile,
  UseInterceptors,
} from '@nestjs/common';
import { ParseIntPipe } from '@nestjs/common/pipes/parse-int.pipe';
import { FileInterceptor } from '@nestjs/platform-express';
import { LogService } from 'src/log/log.service';
import { Attribute } from '../../entities/Attribute';
import { AttributeDto } from './attribute.dto';
import { AttributeService } from './attribute.service';

@Controller('attribute')
export class AttributeController {
  constructor(private categoryService: AttributeService,private logService:LogService) { }
  @Get('/all')
  async findMaster() {
    const attribute = await this.categoryService.findAll().catch(async (err: Error) => {
      let dataLog = {
        // loginId: 2,
        file: 'attribute-findMaster',
        extra: err.stack.toString(),
        error: err.message.toString(),
      }
      await this.logService.create(dataLog);
      throw new HttpException({
        statusCode: HttpStatus.BAD_REQUEST,
        message: err.message
      }, HttpStatus.BAD_REQUEST);
    })
    return {
      statusCode: HttpStatus.OK,
      message: 'data fetched successfully',
      attribute
    };
  }

}