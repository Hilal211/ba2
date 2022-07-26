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
import { Product } from '../../entities/Product';
import { ProductDto } from './product.dto';
import { ProductService } from './product.service';

@Controller('product')
export class ProductController {
  constructor(private productService: ProductService,private logService:LogService) { }

  @Post('/getall')
  @UseInterceptors(FileInterceptor(''))
  async findAll(@UploadedFile() file: Express.Multer.File,@Body() data:{}) {
    let products = await this.productService.findAll(data).catch(async (err: Error) => {
      let dataLog = {
        // loginId: 2,
        file: 'product-findAll',
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
      message: 'success',
      data: products
    };
  }

  //  @Patch('/update/:id')
  // async uppdateProduct(@Param('id') id: number, @Body() data: Partial<ProductDto>) {
  //   await this.productService.update(id, data);
  //   return {
  //     statusCode: HttpStatus.OK,
  //     message: 'User updated successfully',
  //   };
  // }

}