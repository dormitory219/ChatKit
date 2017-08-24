//
//  UpLoadFileHelper.m
//  KeyBoardView
//
//  Created by 余强 on 16/3/28.

//

#import "UpLoadFileHelper.h"



@implementation UpLoadFileHelper
{
    
    AFHTTPSessionManager *_manage;
    
}



+ (instancetype)helper
{
    static dispatch_once_t onceToken;
    static UpLoadFileHelper * helper = nil;
    dispatch_once(&onceToken, ^{
        helper = [[self alloc]init];
    });
    return helper;
}



- (instancetype)init
{
    
    self = [super init];
    if (self) {
        
        _manage = [AFHTTPSessionManager manager];
    
    
    }
    return self;
}




#pragma mark --- 监听上传进度

- (void)uploadFiles:(FileConfig *)files
           progress:(progressBlock)progressHandler
         completion:(void(^)(id responseObject))completion
            failure:(void(^)(NSError *error))failure
{
    [self uploadFilesWithUrl:files.url datas:files.fileDatas serveName:files.serverName  fileNames:files.fileNames mimeType:files.mimeType params:files.parameter progress:progressHandler completion:completion failure:failure];
    
}



/**
 *  @brief 监听上传进度
 *
 *  @param url                 <#url description#>
 *  @param datas               <#datas description#>
 *  @param serverName          <#serverName description#>
 *  @param fileNames             文件名字数组：可为nil,外部不传值按时间命名，格式为.jpg
 *  @param mimeType            <#mimeType description#>
 *  @param params              <#params description#>
 *  @param progressHandler     <#progressHandler description#>
 *  @param completion          <#completion description#>
 *  @param failure             <#failure description#>
 */
- (void)uploadFilesWithUrl:(NSString *)url
                     datas:(NSArray *)datas
                 serveName:(NSString *)serverName
                 fileNames:(NSArray *)fileNames
                  mimeType:(NSString *)mimeType
                    params:(NSDictionary *)params
                  progress:(progressBlock)progressHandler
                completion:(void(^)(id responseObject))completion
                   failure:(void(^)(NSError *error))failure 
{

    //  _manage.requestSerializer = ;
    
    [_manage POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        
        for (int i = 0; i<datas.count; i++) {
            
            NSDate *date = [NSDate date];
            NSDateFormatter *formate = [[NSDateFormatter alloc]init];
            formate.dateFormat = @"yyyy/MM/dd hh:mm:ss";
            NSString *dateString = [formate stringFromDate:date];
            
            //photo:
            NSString *fileName = [dateString stringByAppendingString:@".jpg"];
            //or
            // NSString *fileName = date;
            
            
            //name:服务器上传文件名字  fileName:上传图片的名字  mineType:服务器指定的type:
            //formData拼接所有图片url或data数据
            
            if([datas[i] isKindOfClass:[NSData class]])
            {
                if (fileNames) {
                    [formData appendPartWithFileData:datas[i] name:serverName fileName:fileNames[i] mimeType:mimeType];
                }else{
                    
                    [formData appendPartWithFileData:datas[i] name:serverName fileName:fileName mimeType:mimeType];
                }
                
            }
            else{
                
                if (fileNames) {
                    [formData appendPartWithFileURL:datas[i] name:serverName fileName:fileNames[i] mimeType:mimeType error:nil];
                }else{
                    [formData appendPartWithFileURL:datas[i] name:serverName fileName:fileName mimeType:mimeType error:nil];
                }
                
            }
        }
        
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progressHandler(uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        completion(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
       
    }];
    
}



@end





@implementation FileConfig

+ (instancetype)fileConfigWithUrl:(NSString *)url
                         fileData:(NSArray *)fileDatas
                        serveName:(NSString *)serveName
                         fileName:(NSArray *)fileNames
                         mimeType:(NSString *)mimeType
{
    return [[self alloc]initWithUrl:url
                           fileData:fileDatas
                          serveName:serveName
                          fileNames:fileNames
                           mimeType:mimeType];
}

- (instancetype)initWithUrl:(NSString *)url
                   fileData:(NSArray *)fileDatas
                  serveName:(NSString *)serveName
                  fileNames:(NSArray *)fileNames
                   mimeType:(NSString *)mimeType
{
    if (self = [super init]) {
        _url = url;
        _fileDatas  = fileDatas;
        _serverName = serveName;
        _fileNames = fileNames;
        _mimeType = mimeType;
    }
    return self;
}
@end
