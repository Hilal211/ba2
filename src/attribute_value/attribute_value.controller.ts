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
import { AttributeValue } from '../../entities/AttributeValue';
import { AttributeValueDto } from './attribute_value.dto';
import { AttributeValueService } from './attribute_value.service';

@Controller('attribute-value')
export class AttributeValueController {
  constructor(private AttributeValueService: AttributeValueService,private logService:LogService) { }
  @Get('/all')
  async findMaster() {
    const attributeValue = await this.AttributeValueService.findAllWithAttribute().catch(async (err: Error) => {
      let dataLog = {
        // loginId: 2,
        file: 'attributeValue-findMaster',
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
      attributeValue
    };
  }

}