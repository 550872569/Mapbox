//
//  YHPLoginAccountViewController.m
//  Demo
//
//  Created by liu David on 16/7/27.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "YHPLoginViewController.h"

@interface YHPLoginViewController ()<UITextFieldDelegate,MBProgressHUDDelegate>
@property (nonatomic, strong) UITextField *textFieldPhoneNum;
@property (nonatomic, strong) UITextField *textFieldReturnNum;
@property (nonatomic, strong) UIButton *buttonGetReturnNum;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, assign) NSInteger count;//倒计时
@property (nonatomic,assign,getter = isSending)BOOL sending;
@property (nonatomic,strong) YHPGetPhoneReturnNumberViewModel *viewModel;


@end

@implementation YHPLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_RANDOM;
    [self monitorNetStatus];
    [self loadData];
    [self configUI];
}
/** 获取网络数据 */
- (void)loadData {
    
    self.viewModel = [YHPGetPhoneReturnNumberViewModel new];
    __block typeof(self) weakSelf = self;
    
    /** 基类 viewModel block的 set方法 */
    [self.viewModel setBlockWithSusscessBlock:^(id success) {
        if (success) {
            [weakSelf sendAction];
        }
    } WithFailureBlock:^(YHPRegisterGetPhoneNumerResult *failure) {
        MBProgressHUD * HUD = [MBProgressHUD new];
        HUD.delegate = weakSelf;
        [MachaoTool showMBPrograssHUD:weakSelf.view ShowStr:failure.reason MB:HUD IN:NSTextAlignmentLeft];
    } WithErrorBlock:^(id error) {
        [MBProgressHUD showError:@"网络不给力"];
    }];
    
    /** block 赋值*/
    [self.viewModel TestPhoneReturnNumberWithSuccessBlock:^(YHPRegisterGetPhoneNumerResult *success) {
        self.sending = NO;
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    
    } WithFailureBlock:^(YHPRegisterGetPhoneNumerResult *failure) {
        self.sending = NO;
        [MBProgressHUD hideAllHUDsForView:weakSelf.view animated:YES];
        [MBProgressHUD showError:[NSString stringWithFormat:@"%@",failure.reason]];
    } WithErrorBlock:^(id error) {
        self.sending = NO;
        [MBProgressHUD hideAllHUDsForView:weakSelf.view animated:YES];
        [MBProgressHUD showError:@"网络不给力"];
    }];
}
/** 配置子控件 */
- (void)configUI {
    [self initImageViewBg];
    [self initUI];
}
/** 初始化子控件 */
- (void)initUI {
    UIImageView *imageViewTop = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"LoginAccount_top_Image"]];
    [self.view addSubview:imageViewTop];
    [imageViewTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(50);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(SCREEN_WIDTH * 0.5));
        make.height.equalTo(@(SCREEN_WIDTH * 0.25));
    }];
    UIImageView *phoneNumBg = [[UIImageView alloc]init];
    phoneNumBg.layer.cornerRadius = 3;
    phoneNumBg.image = [UIImage imageNamed:@"LoginAccount_textField_bg"];
    [self.view addSubview:phoneNumBg];
    [phoneNumBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageViewTop.mas_bottom).mas_offset(50);
        make.left.equalTo(self.view).mas_offset(kSpaceLeft);
        make.right.equalTo(self.view).mas_offset(-kSpaceRight);
        make.height.mas_equalTo(@(kTextFieldHeight));
    }];
    
    _textFieldPhoneNum = [[UITextField alloc]init];
    _textFieldPhoneNum.backgroundColor = [UIColor clearColor];
    UILabel *placeholderPhoneNum = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 90, 30)];
    placeholderPhoneNum.text = @"  请输入手机号";
    placeholderPhoneNum.alpha = 0.6;
    placeholderPhoneNum.textColor = [UIColor whiteColor];
    placeholderPhoneNum.font = [UIFont systemFontOfSize:13];
    _textFieldPhoneNum.leftView = placeholderPhoneNum;
    _textFieldPhoneNum.leftViewMode = UITextFieldViewModeAlways;
    _textFieldPhoneNum.delegate = self;
    _textFieldPhoneNum.returnKeyType = UIReturnKeyDone;
    _textFieldPhoneNum.keyboardType = UIKeyboardTypeDecimalPad;
    _textFieldPhoneNum.font = [UIFont systemFontOfSize:kNormolFont];
    _textFieldPhoneNum.textColor = [UIColor whiteColor];
    _textFieldPhoneNum.tintColor = [UIColor whiteColor];
    [self.view addSubview:_textFieldPhoneNum];
    [_textFieldPhoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneNumBg);
        make.left.equalTo(phoneNumBg);
        make.right.equalTo(phoneNumBg);
        make.height.mas_equalTo(@(kTextFieldHeight));
    }];
    
    UIImageView *returnNumBg = [[UIImageView alloc]init];
    returnNumBg.layer.cornerRadius = 3;
    returnNumBg.image = [UIImage imageNamed:@"LoginAccount_textField_bg"];
    [self.view addSubview:returnNumBg];
    [returnNumBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_textFieldPhoneNum.mas_bottom).mas_offset(kSpaceTop*3);
        make.left.equalTo(self.view).mas_offset(kSpaceLeft);
        make.right.equalTo(self.view).mas_offset(-kSpaceRight);
        make.height.mas_equalTo(@(kTextFieldHeight));
    }];
    
    _textFieldReturnNum = [[UITextField alloc]init];
    _textFieldReturnNum.backgroundColor = [UIColor clearColor];
    UILabel *placeholderReturnNum = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 90, 30)];
    placeholderReturnNum.text = @"  请输入验证码";
    placeholderReturnNum.alpha = 0.6;
    placeholderReturnNum.textColor = [UIColor whiteColor];
    placeholderReturnNum.font = [UIFont systemFontOfSize:13];
    _textFieldReturnNum.leftView = placeholderReturnNum;
    _textFieldReturnNum.leftViewMode = UITextFieldViewModeAlways;
    _textFieldReturnNum.delegate = self;
    _textFieldReturnNum.returnKeyType = UIReturnKeyDone;
    _textFieldReturnNum.keyboardType = UIKeyboardTypeDecimalPad;
    _textFieldReturnNum.font = [UIFont systemFontOfSize:kNormolFont];
    _textFieldReturnNum.textColor = [UIColor whiteColor];
    _textFieldReturnNum.tintColor = [UIColor whiteColor];
    [self.view addSubview:_textFieldReturnNum];
    [_textFieldReturnNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(returnNumBg);
        make.left.equalTo(returnNumBg);
        make.right.equalTo(returnNumBg);
        make.height.mas_equalTo(@(kTextFieldHeight));
    }];

    
    _buttonGetReturnNum = [UIButton buttonWithType:UIButtonTypeCustom];
    _buttonGetReturnNum.layer.cornerRadius = 3;
    _buttonGetReturnNum.layer.borderColor = [UIColor whiteColor].CGColor;
    _buttonGetReturnNum.layer.borderWidth = 1;
    _buttonGetReturnNum.alpha = 0.6;
    [_buttonGetReturnNum setTitle:@"获取验证码" forState:UIControlStateNormal];
    _buttonGetReturnNum.titleLabel.textColor = [UIColor whiteColor];
    _buttonGetReturnNum.titleLabel.font = [UIFont systemFontOfSize:12];
    _buttonGetReturnNum.backgroundColor = [UIColor clearColor];
    [_buttonGetReturnNum addTarget:self action:@selector(buttonGetReturnNumAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonGetReturnNum];
    [_buttonGetReturnNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_textFieldReturnNum.mas_right).with.offset(-kSpaceRight);
        make.centerY.equalTo(_textFieldReturnNum);
        make.height.mas_offset(@22);
        make.width.mas_offset(@78);
    }];
    
    UIButton*buttonLogin = [[UIButton alloc]init];
    [buttonLogin addTarget:self action:@selector(buttonLoginAction) forControlEvents:UIControlEventTouchUpInside];
    [buttonLogin setTitle:@"登录" forState:UIControlStateNormal];
    [buttonLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    buttonLogin.backgroundColor = [UIColor clearColor];
    buttonLogin.layer.cornerRadius = 5;
    buttonLogin.layer.borderColor = [UIColor whiteColor].CGColor;
    buttonLogin.layer.borderWidth = 1;
    [self.view addSubview:buttonLogin];
    [buttonLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_textFieldReturnNum.mas_bottom).with.offset(50);
        make.height.mas_equalTo(@(kTextFieldHeight));
        make.left.equalTo(self.view).with.offset(kSpaceLeft);
        make.right.equalTo(self.view).with.offset(-kSpaceRight);
    }];
}
/** 获取验证码button method */
- (void)buttonGetReturnNumAction {
    NSLog(@"buttonGetReturnNumAction");
    [_textFieldReturnNum resignFirstResponder];
    [_textFieldPhoneNum resignFirstResponder];
    // 在这里发获取验证码的交易
    NSString *message = nil;
    if ([_textFieldPhoneNum.text isEqualToString:@""]|| _textFieldPhoneNum.text ==NULL || _textFieldPhoneNum.text.length < 11) {
        message = @"请您输入正确的电话号码";
        if (message.length !=0) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"亲！" message:message preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
            return;
        }
    }
    
    if ( [_textFieldReturnNum.text isEqualToString:@""]|| _textFieldReturnNum.text ==NULL) {
        message = @"请您输入正确的验证码";
        if (message.length !=0) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"亲！" message:message preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
            return;
        }
    }
    YHPGetPhoneReturnNumerParameter * parameter = [YHPGetPhoneReturnNumerParameter new];
    parameter.cellphone = _textFieldReturnNum.text;
    parameter.type = @"register";
    [self.viewModel GetPhoneReturnNumberParam:parameter];
}
/** 登录button method */
- (void)buttonLoginAction {
    NSLog(@"buttonLoginAction");
    [_textFieldReturnNum resignFirstResponder];
    [_textFieldPhoneNum resignFirstResponder];
    NSString *message =@"";
    if ([_textFieldPhoneNum.text isEqualToString:@""]|| _textFieldPhoneNum.text ==NULL || _textFieldPhoneNum.text.length < 11) {
        message = @"请您输入正确的电话号码";
        if (message.length !=0) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"亲！" message:message preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
            return;
        }
    }
    
    if ( [_textFieldReturnNum.text isEqualToString:@""]|| _textFieldReturnNum.text ==NULL) {
        message = @"请您输入正确的验证码";
        if (message.length !=0) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"亲！" message:message preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
            return;
        }
    }
    
    _buttonGetReturnNum.enabled = YES;
    [_buttonGetReturnNum setTitle:@"获取验证码" forState:UIControlStateDisabled];
    _number = 1;
    // 发登录的交易
    [self performSelector:@selector(login) withObject:nil];
}
/** 登录 method */
- (void)login {
    [self.view endEditing:YES];
    if (self.sending) {
        return;
    }
    [MBProgressHUD showMessage:@"加载中..." toView:self.view];
    self.sending = YES;
    YHPTestPhoneReturnNumberParamter *parameterTest = [[YHPTestPhoneReturnNumberParamter alloc]init];
    parameterTest.cellphone = _textFieldPhoneNum.text;
    parameterTest.sms_verification_code = _textFieldReturnNum.text;
    parameterTest.device_token = nil;
//    parameterTest.device_token = [JPUSHService registrationID];
    [self.viewModel TestPhoneReturnNumberParam:parameterTest];
}
- (void)initImageViewBg {
    UIImageView *imageViewBg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    imageViewBg.image = [UIImage imageNamed:@"LoginAccount_logo_bg"];
    [self.view addSubview:imageViewBg];
}
/** 修改子控件布局 */
- (void)viewDidLayoutSubviews {
    
}
- (void)sendAction {
    _buttonGetReturnNum.enabled = NO;
    _count = 60;
    _number = 0;
    [_buttonGetReturnNum setTitle:@"60秒" forState:UIControlStateDisabled];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
}
/** 倒计时 */
- (void)timerFired:(NSTimer *)timer {
    if (_count !=0 && _number ==0) {
        _count -=1;
        NSString *str = [NSString stringWithFormat:@"%ld秒", (long)_count];
        [_buttonGetReturnNum setTitle:str forState:UIControlStateDisabled];
    }else{
        [timer invalidate];
        _buttonGetReturnNum.enabled = YES;
        [_buttonGetReturnNum setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
}
#pragma mark ------网络状态
- (void) monitorNetStatus{
    if (![self connectedToNetwork]) {
        //没网络
        UIAlertView *alterView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"网络未连接" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"去设置", nil];
        [alterView show];
        
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"网络未连接" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//        UIAlertAction *actionSetting = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:nil];
//        [alertController addAction:actionSetting];
//        [alertController addAction:actionCancel];
//        [self presentViewController:alertController animated:YES completion:^{
//            [NSThread sleepForTimeInterval:5];
//        }];
        
    } else {
        NSLog(@"网络正常");
    }
}
#pragma mark - 判断是否有网络
-(BOOL) connectedToNetwork {
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        printf("Error. Could not recover network reachability flags\n");
        return NO;
    }
    
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
}
/** 屏幕点击method */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"yhp log -------------------YHPLoginAccountViewController");
}

@end
