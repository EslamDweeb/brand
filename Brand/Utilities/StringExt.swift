//
//  StringExt.swift
//  Brand
//
//  Created by nada dyaa on 7/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//
import Foundation
import MOLH
extension String {
    static let fontM =  "Avenir-Medium"
    static let fontL = "Avenir-Light"
    static let fontH =  "Avenir-Heavy"
    var localized : String {
        //return NSLocalizedString(self, comment: "")
        return YString.getText(key: self)
    }
}

class YString {
     static var Noresult : String { return getText(key: "Noresult") }
     static var NoProuct : String { return getText(key: "No Products") }
     static var male : String { return getText(key: "male") }
     static var female : String { return getText(key: "female") }
    static var personal_information : String { return getText(key: "personal_information") }
    static var myAddresses : String { return getText(key: "myAddresses") }
    static var cart : String { return getText(key: "cart") }
    static var myOrders : String { return getText(key: "myOrders") }
    static var myReview : String { return getText(key: "myReview") }
    static var language : String { return getText(key: "language") }
    static var about : String { return getText(key: "about") }
    static var terms_privacy : String { return getText(key : "terms&privacy") }
    static var returnPolicy : String { return getText(key: "returnPolicy") }
    static var saleInBrand : String { return getText(key: "saleInBrand") }
    static var buyFromBrand : String { return getText(key: "buyFromBrand") }
    static var logout : String { return getText(key: "logout") }
    
    static var productOptions : String { return getText(key: "productOptions") }
    static var itemPrice : String { return getText(key: "itemPrice") }
    static var quantity : String { return getText(key: "quantity") }
    static var totalPrice : String { return getText(key: "totalPrice" ) }
    static var addToCart : String { return getText(key: "addToCart") }
    static var selectOption : String { return getText(key: "selectOption") }
    static var done : String { return getText(key: "done") }
    static var notification:String {return getText(key: "notification")}
    static var delete : String { return getText(key: "delete") }
    static var edit : String { return getText(key: "edit") }
    static var updateProduct : String { return getText(key: "updateProduct") }
    static var socialSignUp : String { return getText(key: "socialSignUp") }
    static var sign_up : String { return getText(key: "sign_up") }
    static var pleaseEnterValidEmail : String { return getText(key: "pleaseEnterValidEmail") }
    static var passwordMustBeGreaterThan5Char : String { return getText(key: "passwordMustBeGreaterThan5Char") }
    static var menu : String { return getText(key: "menu") }
    static var startShopping : String { return getText(key: "startShopping") }
    static var yourCartIsEmpty : String { return getText(key: "yourCartIsEmpty") }
    static var termsAndPrivacy:String{return getText(key: "terms&privacy")}
    static var customerService:String{return getText(key: "customerService")}
    static var saleOnBrand:String{return getText(key: "saleInBrand")}
    static var savedItem:String{return getText(key: "savedItem")}
    static var searchPlaceHolder:String{return getText(key: "searchPlaceHolder")}
    static var checkoutNow:String{return getText(key: "checkoutNow")}
    static var notificationEmpty:String{return getText(key: "notificationEmpty")}
    static var pleseLoginFirst:String{return getText(key: "pleaseLoginFirst")}
    static var login:String{return getText(key: "login")}
    static var phoneValidation:String{return getText(key: "phone_not_correct")}
    static var allFieldsReq:String{return getText(key: "allFieldsreq")}
    static var validEmailOrPassword:String{return getText(key: "validEmailOrPassword")}
    static var savedItemEmpty:String{return getText(key: "savedItemEmpty")}
    static var cantDeleteMainAddress:String{return getText(key: "cantDeleteMainAddress")}
    static var thisYourMain:String{return getText(key: "thisYourMain")}
    static var shipingAddress:String{return getText(key: "shipingAddress")}
    static var outOfStock : String { return getText(key: "outOfStock") }
    static var errorAddingProductToCart : String { return getText(key: "errorAddingProductToCart") }
    static var thisProductIsAlreadyInCart : String { return getText(key: "thisProductIsAlreadyInCart") }
    static var emailFieldRequird:String{return getText(key: "Empty Email")}
    static var passwordFieldRequird:String{return getText(key: "emptyPassword")}
    static var invalidPersonName:String{return getText(key: "Invalid Person Name")}
    static var invalidEmail:String{return getText(key: "Invalid Email")}
    static var serverError:String{return getText(key: "serverError")}
    static var firstNameMustBeGreaterThan3Char : String { return getText(key: "firstNameMustBeGreaterThan3Char" ) }
    static var lastNameMustBeGreaterThan3Char : String { return getText(key: "lastNameMustBeGreaterThan3Char") }
    static var description : String { return getText(key: "description") }
    static var errorHappen : String { return getText(key: "errorHappen") }
    
    
    static func getText (key : String) -> String {
        
        if MOLHLanguage.currentAppleLanguage().contains("en") {
            return enString[key] ?? key
        }else {
            return arString[key] ?? key
        }
        
    }
    static private let arString : [String : String] = [
        "max" : "اقصي كميه",
        "min" : "اقل كميه" ,
        "soon" : "قريبا",
        "now" : "الآن",
        "Noresult" : "لا يوجد نتائج",
        "No Products" : "لا يوجد منتجات" ,
        "All Product" : "كل المنتجات",
        "Available offers" :"العروض المتاحه" ,
        "Order review" : "مراجعه الطلب",
        "select_gender" : "اختر النوع",
        "male" : "ذكر" ,
        "female" : "انثي",
         "select_billing_Methoud" : "يجب ان تختار طريقه الدفع",
        "selectـShippingـMethoud" : "يجب ان تختار طريقه الشحن",
        "selectـAddress" : "يجب ان تختار عنوان الشحن",
        "photo_source" : "مصدر الصوره",
        "choose_your_photo" : "اختر صورتك الشخصيه",
        "no_image" : "لا يوجد صور",
        "apply" : "تنفيذ" ,
        "Search" :  "بحث",
        "Search filter" : "بحث متقدم",
        "price" : "السعر",
        "rate"  :  "تقيم",
        "Made_in" : "مصنوعه في",
        "from" : "من",
        "to" : "الي",
        "cart" : "سلة المشتريات",
        "QTY" : "الكميه ",
        "Outofstock" : "نفذ من المتجر",
        "exceeded" : "نفذت الكميه",
        "sar" : "ر.س",
        "Items" : "الكميه: ",
        "Pilling_method" : "طريقه الدفع ",
        "Shippingـmethod" : "طريقه الشحن",
        "Your Addresses" : "عناوينك",
        "Apply Copoun" : "ادخل الكود",
        "Copoun_discount" : "قيمه الخصم",
        "copoun" : "كود",
        "addReview" : "اضف تقيم",
        "Amount" : "الكمية" ,
        "total" : "الاجمالي",
        "shop" : "تسوق الان",
        "Confirm" : "تاكيد الطلب",
        "tax" : "ضريبه",
        "Order_Details" : "تفاصيل الطلب",
        "reset" : "اعادة تعيين",
        "There is no Address" : "لا يوجد عنوان",
        "CONTINUE"  : "استمرار",
        "txt_continue"  : "استمرار",
        "PENDING" : "قيد الانتظار",
        "DELIVERED" : "تم التسليم",
        "OTHER" : "غير ذلك",
        "Cancel Order" : "الغاء الطلب",
        "Order_Status" : "حاله الطلب",
        "didn’t_have_Address" :  "ناسف لا يوجد لديك عناوين",
        "Unit price" : "سعر الوحده",
        "Name" : "الاسم",
        "Shipping Method" : "طريقه الشحن",
        "Shipping fee" : "ضريبه الشحن",
        "Billing Method" : "طريقه الدفع",
        "Billing Fee" : "ضريبه الدفع",
        "Order_Items" : "عناصر الطلب",
        "orderNumber" : "رقم الطلب",
        "orderDate" : "تاريخ الطلب",
        "totalAmount" : "الكميه المطلوبه",
        "orderStatus" : "حالة الطلب",
        "allFieldsreq" : " جميع الحقول مطلوبه برجاء ادخل البينات المطلوبه ",
        "invphone" : "رقم هاتف خطا",
        "invpostal" : "رمز بريدي خاطئ يجب ان يكون خمسه ارقام",
        "Invalid City" : "برجاء ادخال مدينه صحيحه",
        "Invalid Person Name" : "اسم المستخدم يجب ان يحتوي علي ثلاثة احرف علي الاقل",
        "Invalid Provider Name" : "برجاء ادخال اسم مزود صحيح" ,
        "Invalid Address Name" : "يجب ان يحتوي العنوان علي ثلاثة احرف علي الاقل",
        "Invalid Email" : "بريد الكتروني خاطئ" ,
        "Empty Bio" : "يجب ادخال سيره ذاتيه ",
        "Empty Phone" : "يجب ادخال رقم هاتف",
        "Empty Address name" : "يجب ادخال عنوان",
        "Empty Person Name" : "يجب ادخال اسم " ,
        "Empty city" : "يجب ادخال مدينه" ,
        "Must Select Your Country" : "يجب اختيار الدوله" ,
        "Must Select Your State" : "يجب اختيار المحافظه",
        "Empty Email" : "يجب ادخال بريد الكتروني ",
        "latitude" : "خطوط العرض يجب ان تكون ارقام",
        "longitude" : "خطوط الطول يجب ان تكون ارقام",
        "latVal" : "خطوط العرض",
        "langVal" : "خطوط الطول",
        "shipingAddress":"عنوان الشحن"  ,
        "camera" : "الكاميرة",
        "mustHavePhoto" : "يجب ان يكون لديك صوره اولاً",
        "myAddresses" : "عناويني",
        "person_name" : "اسم المستخدم",
        "wishlist" : "التمنيات",
        "myOrders" : "طلباتي",
        "myReview" : "تقييمي",
        "language" : "اللغة الحالية",
        "about" : "عنا",
        "terms&privacy" : "الشروط والخصوصية",
        "customerService" : "خدمة العملاء",
        "returnPolicy" : "سياسة العائدات",
        "logout" : "تسجيل الخروج",
        "followus" : "اتبعنا",
        "settings" : "الإعدادات",
        "description" : "التفاصيل",
        "relatedProduct" : "المنتجات ذات صله",
        "seeAll" : "الكل",
        "color" : "الالوان",
        "size" : "الحجم",
        "Shipping_Addresses" : "عنوان الشحن",
        "photo_library" : "مكتبة الصور",
        "app_name" : "BrandsApp",
        "retry" : "اعادة المحاولة",
        "no_internet" : "ﻻ يوجد اتصال بالإنترنت",
        "failed_authenticate_please" : "فشل التوثيق، يرجى المحاولة مرة أخري",
        "explore" : "استكشف",
        "createAccount" : "إنشاء حساب",
        "My addresses" : "عنواني",
        "firstName" : "الأسم الأول",
        "lastName" : "اﻷسم اﻷخير",
        "personName" : "اسم الشخص",
        "phone" : "رقم الجوال",
        "email" : "البريد الإلكتروني",
        "signup" : "أنشئ حساب",
        "already_a_member_login" : "عضو بالفعل؟ ",
        "by_signing_up_you_accept_terms_and_privacy_policy" : "بتسجيل الدخول ، يتم موافقتك علي سياسةالشروط والاحكام  ",
        "login" : "تسجيل الدخول",
        "forgotPassword" : " نسيت كلمة السر؟",
        "email_phone" : "البريدالإلكتروني / الجوال",
        "password" : "كلمة السر",
        "required" : "مطلوب",
        "Add new address" : "اضافة عنوان جديد",
        "phone_not_correct":"رجاء ادخل رقم جوال صحيح",
        "email_not_correct" : "البريد الإلكتروني غير صحيح",
        "addresses_book" : "دفتر العناوين",
        "don_t_have_an_acount" : "ليس لديك حساب؟ ",
        "or_login_with" : "أو تسجيل الدخول عبر",
        "please_login_to_continue" : "للإستمرار يرجى تسجيل الدخول",
        
        "forgot_your_password" : "نسيت كلمة السر",
        "enter_your_email_phone_below_to_reset_your_password" : " يرجى إدخال البريد الإلكترونى أو الهاتف لإعادة تعين كلمة السر",
        "new_address" : "عنوان جديد",
        "no_addresses" : "لا يوجد عناوين",
        "new_password" : "كلمة سر جديدة",
        "confirm_new_password" : "أكد كلمة السر الجديدة",
        "request_new_one" : "اطلب واحد جديد",
        "didn_t_receive_a_code" : "لم تستلم رقم تسلسلى؟",
        "please_type_your_new_password" : "من فضلك ادخل كلمة السر الجديدة",
        "we_will_send_you_a_short_code_to_reet_your_password" : "سوف يتم ارسال كود لإعادة ضبط كلمة السر",
        "password_has_been_reset_successfully" : "تم إعادة ضبط كلمة السر بنجاح",
        "address_name" : "اسم العنوان",
        "country" : "الدولة",
        "state" : "المحافظة",
        "city" : "المدينة",
        "detailed_address" : "العنوان بالتفصيل",
        "postal_code" : "الرقم البريدي",
        "location" : "الموقع",
        "lat" : "الطول",
        "lang" : "العرض",
        "pick_location" : "اختر الموقع",
        "confirm" : "تأكيد",
        "edit_address" : "تعديل العنوان",
        "save" : "حفظ",
        "personal_information" : "البيانات الشخصية",
        "personal_info" : "بيانات المستخدم",
        "security_info" : "بيانات الحماية",
        "address_info" : "بيانات العنوان",
        "current_password" : "الرقم السري الحالي",
        "profile" : "المستخدم",
        "birth_date" : "تاريخ الميلاد",
        "gender" : "اختار الجنس",
        "skip" : "تخطي",
        "date" : "التاريخ",
        "reset_password" : "إعادة تعيين كلمة السر",
        "failed_authenticate_lease" : "فشل التوثيق، يرجى المحاولة مرة أخري",
        "set_default" : "تعيين عنوان رئيسي",
        "edit" : "تعديل",
        "delete" : "حذف",
        "cancel" : "إلغاء",
        "canceled" : "تم الالغاء",
        "email_not_valid" : "بريد الكترونى غير صالح",
        "notification" : "الإشعارات",
        "my_reviews" : "تقيماتي",
        "get_started" : "فلنبدأ",
        "Email/phone" : "البريد الالكتروني/ الهاتف",
        "Shipping" : "التسوق",
        "saleInBrand" : "Sell On Brands Sa",
        "buyFromBrand" : "Buy From Brands Sa",
        "recommendedProduct" : "المنتجات المقترحه",
        "latestProduct" : "المنتجات الاحدث",
        "popularProduct" : "المنتجات المشهوره",
        "flashSale" : "Flash sale",
        "subCategorie" : "عناصر فرعيه",
        "browesBy" : "Browse by sub category",
        "stars" : "****************",
        "checkoutNow" : "الدفع الآن",
        "productOptions" : "خيارات المنتج",
        "itemPrice" : "سعر المنتج",
        "quantity" : "الكمية",
        "totalPrice" : "السعر الكلي" ,
        "addToCart" : "اضف الي العربة",
        "selectOption" : "اختر" ,
        "done" : "تم",
        "updateProduct" : "تحديث المنتج",
        "socialSignUp" : "تسجيل الدخول",
        "sign_up" : "تسجيل الدخول",
        "pleaseEnterValidEmail" : "من فضلك اضف ايميل صحيح",
        "passwordMustBeGreaterThan5Char" : "كلمة المرور لابد ان تكون اكبر من ٥ حروف",
        "menu" : "القائمة",
        "startShopping" : "ابدا التسوق",
        "yourCartIsEmpty" : "للاسف سله المشتريات فارغه",
        "savedItem":"العناصر المحفوظه",
        "searchPlaceHolder":"ما الذي تبحث عنه؟",
        "notificationEmpty":"لا يوجد اشعارات بعد",
        "pleaseLoginFirst":"من فضلك سجل دخول اولا",
        "savedItemEmpty":"للآسف ليس لديك عناصر محفوظه ",
        "cantDeleteMainAddress":"للآسف لاتستطيع حذف العنوان الاساسي",
         "thisYourMain":"هذا بالفعل هو العنوان الاساسي",
        "validEmailOrPassword":"برجاء ادخال رقم هاتف او بريد الكتروني صحيح" ,
        "emptyPassword":"كلمة المرور مطلوبه",
        "serverError":"خطاء في التصال بمزود الخدمه",
        "outOfStock" : "Out of stock" ,
        "errorAddingProductToCart" : "هذا المنتج موجود في العربة" ,
        "thisProductIsAlreadyInCart" : "هذا المنتج موجود ف العربة",
        "firstNameMustBeGreaterThan3Char" : "الاسم الاول لابد ان يكون اكبر من ٣ احرف" ,
        "lastNameMustBeGreaterThan3Char" : "الاسم الاخير لابد ان يكون اكبر من ٣ احرف" ,
        "errorHappen" : "حدث خطا ما، حاول مره اخري"
        
        
        

    ]
    
    static private let enString : [String : String] = [
        "max" : "The max quantity" ,
        "canceled" : "Canceled" ,
        "min" : "The min quantity" ,
        "soon" : "Soon",
        "now" :"Now",
        "Noresult" : "No Result" ,
        "No Products" : "No Products",
        "All Product" :"All Product" ,
        "Available offers" : "Available offers" ,
         "Order review" : "Order review",
        "select_gender" : "Select gender" ,
        "male" : "Male" ,
        "female" : "Female",
        "select_billing_Methoud" : "You Must select Your Billing Methoud",
        "selectـShippingـMethoud" : "You Must select Your Shipping Methoud",
         "selectـAddress" : "You Must select Your shipping Address",
        "choose_your_photo" : "Choose your photo",
        "photo_source" : "Photo source" ,
        "no_image" : "There is no image" ,
        "shop" : "Shop now",
        "Search" : "Search" ,
        "apply" : "Apply" ,
        "Search filter" :  "Search filter" ,
        "rate"  :  "rate",
        "Made_in" : "Made in",
        "from" : "From",
        "to" : "To",
        "price" : "Price",
        "cart" : "Cart" ,
        "tax" : "Tax" ,
        "Confirm" : "Confirm & pay" ,
        "total" : "Total" ,
        "addReview" : "Add review" ,
        "shipingAddress":"Shiping Address",
        "copoun" : "Copoun" ,
        "Copoun_discount" : "Copoun discount" ,
        "Apply Copoun" : "Apply Copoun" ,
        "Your Addresses" : "Your Addresses" ,
        "Shippingـmethod" : "Shipping method" ,
        "Shipping_Addresses" : "Shipping Addresses" ,
        "Pilling_method" : "Pilling method" ,
        "checkoutNow" : "Checkout Now" ,
        "size" : "Size" ,
        "color" : "Color" ,
        "seeAll" : "See all" ,
        "relatedProduct" : "Related Products" ,
        "description" : "Description" ,
        "Shipping" : "Shipping" ,
        "recommendedProduct" : "Recommended Products" ,
        "flashSale" : "Flash sale" ,
        "latestProduct" : "Latest Products" ,
        "popularProduct" : "Popular Products" ,
        "subCategorie" : "subCategorie" ,
        "browesBy" : "Browse by sub category" ,
        "orderNumber" : "Order Number" ,
        "orderDate" : "Order Date" ,
        "totalAmount" : "Total Amount" ,
        "orderStatus" : "Order Status" ,
        "allFieldsreq" : " All fields are required " ,
        "invphone" : "Invalid Phone number" ,
        "invpostal" : "Postal Code must contain 5 numbers at least " ,
        "Invalid City" : "Invalid City" ,
        "Invalid Person Name" : "person name must contain 3 letters at least" ,
        "Invalid Provider Name" : "Invalid Provider Name"  ,
        "Invalid Address Name" : "Address must be at least 3 characters" ,
        "Invalid Email" : "Invalid Email"  ,
        "Empty Bio" : "Bio field is required" ,
        "Empty Phone" : "Phone number is required" ,
        "Empty Address name" : "Address name is required" ,
        "Empty Person Name" : " Person Name is required"  ,
        "Empty city" : "City Field is required"  ,
        "Must Select Your Country" : "Must Select Your Country"  ,
        "Must Select Your State" : "Must Select Your State" ,
        "Empty Email" : "Email field is required" ,
        "latitude" : "The latitude must be a number" ,
        "latVal" : "latitude" ,
        "longitude" : "The longitude must be a number." ,
        "langVal" : "longitude" ,
        "retry" : "Retry" ,
        "photo_library" : "Photo Library" ,
        "camera" : "Camera" ,
        "person_name" : "Person Name" ,
        "mustHavePhoto" : "You must upload photo first" ,
        "no_internet" : " No internet connection" ,
        "failed_authenticate_please"  : "Failed to authenticate, Please try again" ,
        "explore" : "Explore" ,
        "createAccount" : "Create account" ,
        "firstName" : "First name" ,
        "lastName" : "Last name" ,
        "personName" : "Person name" ,
        "phone" : "Phone" ,
        "phoneNumber" : "Phone Number" ,
        "email" : "Email" ,
        "signup" : "Signup" ,
        "already_a_member_login" : "Already a member?" ,
        "by_signing_up_you_accept_terms_and_privacy_policy" : "By signing up you accept terms and privacy policy" ,
        "serverError":"Error to connect to server",
        "forgotPassword" : "Forgot password?" ,
        "email_phone" : "Email / Phone" ,
        "password" : "Password" ,
        "required" : "Required" ,
        "phone_not_correct" : "Please enter valid phone number",
        "email_not_correct" : "Email is not correct" ,
        "addresses_book" : "Addresses book" ,
        "don_t_have_an_acount" : "Don\'t have an acount ?" ,
        "or_login_with" : "Or login with" ,
        "please_login_to_continue" : "Please login to continue" ,
        "txt_continue" : "Continue" ,
        "forgot_your_password" : " Forgot your password" ,
        "enter_your_email_phone_below_to_reset_your_password" : "Enter your email/phone below to reset your password" ,
        "new_address" : "New address" ,
        "Add new address" : "Add new address" ,
        "no_addresses" : "No addresses" ,
        "address_name" : "Address name" ,
        "country" : "Country" ,
        "My addresses" : "My addresses" ,
        "state" : "State" ,
        "city" : "City" ,
        "location" : "Location" ,
        "detailed_address" : "Detailed address" ,
        "postal_code" : "Postal code" ,
        "pick_location" : "Pick Location" ,
        "new_password" : "New password" ,
        "confirm_new_password" : "Confirm new password" ,
        "request_new_one" : "Request new one" ,
        "didn_t_receive_a_code" : "Did not receive a code?" ,
        "please_type_your_new_password" : "Please type a new password" ,
        "we_will_send_you_a_short_code_to_reet_your_password" : "We will sent a short code to reset password" ,
        "password_has_been_reset_successfully" : "Password has been reset successfully" ,
        "confirm" : "Confirm" ,
        "edit_address" : "Edit address" ,
        "lat" : "Lat" ,
        "lang" : "Lang" ,
        "save" : "Save" ,
        "cantDeleteMainAddress":"you can't delete your main address",
        "personal_information" : "Personal Information" ,
        "personal_info" : "Personal info" ,
        "security_info" : "Security info" ,
        "address_info" : "Address Info" ,
        "stars" : "****************" ,
        "current_password" : "Current password" ,
        "profile" : "Profile" ,
        "birth_date" : "Birth date" ,
        "gender" : "Gender" ,
        "skip" : "Skip" ,
        "reset_password" : "Reset password" ,
        "failed_authenticate_lease" : "Failed to authenticate. Please try again." ,
        "set_default" : "Set default" ,
        "edit" : "Edit" ,
        "delete" : "Delete" ,
        "cancel" : "Cancel" ,
        "email_not_valid" : "Email not valid" ,
        "notification" : "Notification" ,
        "thisYourMain":"This is your main address Already",
        "my_reviews" : "My Reviews" ,
        "get_started" : "Get Started" ,
        "Email/phone" : "Email/phone" ,
        "CONTINUE" : "CONTINUE" ,
        "There is no Address" : "There is No Address" ,
        "reset" : "Reset" ,
        "date" : "Date" ,
        "Order_Details" : "Order Details" ,
        "Amount" : "Amount" ,
        "Order_Items" : "Order Items" ,
        "Cancelorderafter24" : "* Canceling Order Can not be done after 24 hours ." ,
        "Cancel Order" : "Cancel Order" ,
        "Order_Status" : "Order Status" ,
        "login" : "Login" ,
        "myAddresses" : "My Addresses" ,
        "wishlist" : "Wishlist" ,
        "myOrders" : "My Orders" ,
        "myReview" : "My Review" ,
        "language" : "Current Language" ,
        "about" : "About" ,
        "terms&privacy" : "Terms and Privacy" ,
        "customerService" : "Customer Service" ,
        "returnPolicy" : "Return Policy" ,
        "saleInBrand" : "Sell On Brands Sa" ,
        "buyFromBrand" : "Buy From Brands Sa" ,
        "logout" : "Logout" ,
        "followus" : "Follow us on" ,
        "settings" : "Settings" ,
        "didn’t_have_Address" : "Sorry you didn’t have Address" ,
        "Unit price" : "Unit price" ,
        "Name" : "Name" ,
        "Shipping Method" : "Shipping Method" ,
        "Shipping fee" : "Shipping fee" ,
        "Billing Method" : "Billing Method" ,
        "Billing Fee" : "Billing Fee" ,
        "PENDING" : "PENDING" ,
        "DELIVERED" : "DELIVERED" ,
        "OTHER" : "OTHER" ,
        "Items" : "Items: " ,
        "sar" : "SAR"  ,
        "exceeded" : "Quantity exceeded" ,
        "Outofstock" : "Out of stock" ,
        "QTY" : "QTY" ,
        "productOptions" : "Product options",
        "itemPrice" : "Item price",
        "quantity" : "Quantity",
        "totalPrice" : "Total price" ,
        "addToCart" : "Add to cart",
        "selectOption" : "Select option",
        "done" : "Done",
        "updateProduct" : "Update product",
        "socialSignUp" : "Social signup" ,
        "sign_up" : "sign up",
        "pleaseEnterValidEmail" : "Please enter valid email",
        "passwordMustBeGreaterThan5Char" : "Password must be greater than 5 char",
        "menu" : "Menu",
        "startShopping" : "Start shopping",
        "yourCartIsEmpty" : "opps! Your cart is empty",
        "savedItem":"Saved items",
        "searchPlaceHolder":"What are you looking for?",
        "notificationEmpty":"No notification yet",
        "pleaseLoginFirst":"Please login first",

        "savedItemEmpty":"oops! you didn't have any saved item yet.",
        "validEmailOrPassword":"please enter correct email or phone number" ,
        "errorAddingProductToCart" : "This product already in the cart" ,
        "thisProductIsAlreadyInCart" : "This product is already in cart",
        "emptyPassword":"Password Field is Requird",
        "firstNameMustBeGreaterThan3Char" : "First name must be greater than 3 char" ,
        "lastNameMustBeGreaterThan3Char" : "Last name must be greater than 3 char" ,
        "errorHappen" : "Error happen, please try again"
        
    ]
     
    
    
}

func getError (error : [String : [String]]) -> String {
    var   text = ""
    for (_,v) in error {
        for i in v {
            text += " \(i) "
        }
    }
    return text
}
