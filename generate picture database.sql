USE [master]
GO
/****** Object:  Database [!picture]    Script Date: 31/07/2019 14:37:17 ******/
CREATE DATABASE [!picture] ON  PRIMARY 
( NAME = N'!picture', FILENAME = N'D:\SQL-DATA\!picture.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'!picture_log', FILENAME = N'D:\SQL-DATA\!picture_log.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [!picture] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [!picture].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [!picture] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [!picture] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [!picture] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [!picture] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [!picture] SET ARITHABORT OFF 
GO
ALTER DATABASE [!picture] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [!picture] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [!picture] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [!picture] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [!picture] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [!picture] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [!picture] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [!picture] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [!picture] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [!picture] SET  ENABLE_BROKER 
GO
ALTER DATABASE [!picture] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [!picture] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [!picture] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [!picture] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [!picture] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [!picture] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [!picture] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [!picture] SET RECOVERY FULL 
GO
ALTER DATABASE [!picture] SET  MULTI_USER 
GO
ALTER DATABASE [!picture] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [!picture] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'!picture', N'ON'
GO
USE [!picture]
GO
/****** Object:  User [students\hitmachut]    Script Date: 31/07/2019 14:37:17 ******/
CREATE USER [students\hitmachut] FOR LOGIN [STUDENTS\hitmachut] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_datareader] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [students\hitmachut]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [students\hitmachut]
GO
/****** Object:  Table [dbo].[Albom]    Script Date: 31/07/2019 14:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albom](
	[AlbomId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[TamplateAlbomId] [int] NULL,
	[AlbomDate] [date] NULL,
	[AlbomName] [nvarchar](50) NULL,
	[NumOfPage] [int] NULL,
 CONSTRAINT [PK_Albom] PRIMARY KEY CLUSTERED 
(
	[AlbomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Background]    Script Date: 31/07/2019 14:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Background](
	[BackgroundId] [int] IDENTITY(1,1) NOT NULL,
	[path] [nvarchar](max) NULL,
	[subject] [int] NULL,
	[TemplateAlbom] [int] NULL,
 CONSTRAINT [PK_Background] PRIMARY KEY CLUSTERED 
(
	[BackgroundId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageAlbom]    Script Date: 31/07/2019 14:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageAlbom](
	[PageAlbomId] [int] IDENTITY(1,1) NOT NULL,
	[AlbomID] [int] NULL,
	[path] [nvarchar](max) NULL,
	[NumInAlbom] [int] NULL,
	[photo] [nvarchar](max) NULL,
 CONSTRAINT [PK_PageAlbom] PRIMARY KEY CLUSTERED 
(
	[PageAlbomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageTemplate]    Script Date: 31/07/2019 14:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageTemplate](
	[PageTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[TemplateAlbomId] [int] NULL,
	[path] [nvarchar](max) NULL,
	[photo] [nvarchar](max) NULL,
 CONSTRAINT [PK_PageTemplate] PRIMARY KEY CLUSTERED 
(
	[PageTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[photo]    Script Date: 31/07/2019 14:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[photo](
	[photoId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[path] [nvarchar](max) NULL,
 CONSTRAINT [PK_photo] PRIMARY KEY CLUSTERED 
(
	[photoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shape]    Script Date: 31/07/2019 14:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shape](
	[ShapeId] [int] IDENTITY(1,1) NOT NULL,
	[kod] [nvarchar](max) NULL,
	[subject] [int] NULL,
	[photo] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sticker]    Script Date: 31/07/2019 14:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sticker](
	[StickerId] [int] IDENTITY(1,1) NOT NULL,
	[path] [nvarchar](max) NULL,
	[subject] [int] NULL,
 CONSTRAINT [PK_Sticker] PRIMARY KEY CLUSTERED 
(
	[StickerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 31/07/2019 14:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](50) NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TemplateAlbom]    Script Date: 31/07/2019 14:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TemplateAlbom](
	[TemplateAlbomId] [int] IDENTITY(1,1) NOT NULL,
	[PageSizeheight] [int] NULL,
	[PageSizewidth] [int] NULL,
 CONSTRAINT [PK_TemplateAlbom] PRIMARY KEY CLUSTERED 
(
	[TemplateAlbomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 31/07/2019 14:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserPassword] [nvarchar](50) NULL,
	[UserMail] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Albom] ON 
GO
INSERT [dbo].[Albom] ([AlbomId], [UserId], [TamplateAlbomId], [AlbomDate], [AlbomName], [NumOfPage]) VALUES (1, 1, 1, CAST(N'2023-02-01' AS Date), N'yaeli', 2)
GO
INSERT [dbo].[Albom] ([AlbomId], [UserId], [TamplateAlbomId], [AlbomDate], [AlbomName], [NumOfPage]) VALUES (2, 1, 2, CAST(N'2001-01-01' AS Date), N'new', 3)
GO
INSERT [dbo].[Albom] ([AlbomId], [UserId], [TamplateAlbomId], [AlbomDate], [AlbomName], [NumOfPage]) VALUES (3, 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Albom] ([AlbomId], [UserId], [TamplateAlbomId], [AlbomDate], [AlbomName], [NumOfPage]) VALUES (4, 1, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Albom] ([AlbomId], [UserId], [TamplateAlbomId], [AlbomDate], [AlbomName], [NumOfPage]) VALUES (6, 1, 1, NULL, N'ttttttt', NULL)
GO
INSERT [dbo].[Albom] ([AlbomId], [UserId], [TamplateAlbomId], [AlbomDate], [AlbomName], [NumOfPage]) VALUES (7, 1, 4, NULL, NULL, 4)
GO
INSERT [dbo].[Albom] ([AlbomId], [UserId], [TamplateAlbomId], [AlbomDate], [AlbomName], [NumOfPage]) VALUES (9, 1, 4, NULL, N'yut', NULL)
GO
INSERT [dbo].[Albom] ([AlbomId], [UserId], [TamplateAlbomId], [AlbomDate], [AlbomName], [NumOfPage]) VALUES (10, 1, 2, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Albom] OFF
GO
SET IDENTITY_INSERT [dbo].[Background] ON 
GO
INSERT [dbo].[Background] ([BackgroundId], [path], [subject], [TemplateAlbom]) VALUES (1, N'love/אהבה 01.jpg', 3, 9)
GO
INSERT [dbo].[Background] ([BackgroundId], [path], [subject], [TemplateAlbom]) VALUES (2, N'love/אהבה 02.jpg', 3, 9)
GO
INSERT [dbo].[Background] ([BackgroundId], [path], [subject], [TemplateAlbom]) VALUES (3, N'love/אהבה 03.jpg', 3, 9)
GO
INSERT [dbo].[Background] ([BackgroundId], [path], [subject], [TemplateAlbom]) VALUES (4, N'love/אהבה 04.jpg', 3, 9)
GO
INSERT [dbo].[Background] ([BackgroundId], [path], [subject], [TemplateAlbom]) VALUES (5, N'love/אהבה 05.jpg', 3, 9)
GO
INSERT [dbo].[Background] ([BackgroundId], [path], [subject], [TemplateAlbom]) VALUES (6, N'love/אהבה 06.jpg', 3, 9)
GO
SET IDENTITY_INSERT [dbo].[Background] OFF
GO
SET IDENTITY_INSERT [dbo].[PageAlbom] ON 
GO
INSERT [dbo].[PageAlbom] ([PageAlbomId], [AlbomID], [path], [NumInAlbom], [photo]) VALUES (1, 1, N'<div style="color:aqua;">world</div><div _ngcontent-lnc-c9="" style="display:inline-block;" class=""><img _ngcontent-lnc-c9="" style="height:30px;width:30px" id="localhost:61739/img/stickers/food/תפוח.png" src="http://localhost:61739/img/stickers/food/תפוח.png"></div><div _ngcontent-lnc-c9="" style="display:inline-block;" class=""><img _ngcontent-lnc-c9="" style="height:30px;width:30px" id="localhost:61739/img/stickers/letters/A man.png" src="http://localhost:61739/img/stickers/letters/A man.png"></div><div _ngcontent-yaq-c8="" style="display:inline-block;" class=""><img _ngcontent-yaq-c8="" style="height:30px;width:30px" id="localhost:61739/img/stickers/food/עוגה אישית.png" src="http://localhost:61739/img/stickers/food/עוגה אישית.png"></div>', 1, N'djdyhjgk')
GO
SET IDENTITY_INSERT [dbo].[PageAlbom] OFF
GO
SET IDENTITY_INSERT [dbo].[PageTemplate] ON 
GO
INSERT [dbo].[PageTemplate] ([PageTemplateId], [TemplateAlbomId], [path], [photo]) VALUES (1, 1, N'<div ><span class="glyphicon glyphicon-envelope"></div>', N'fjmjgkh')
GO
INSERT [dbo].[PageTemplate] ([PageTemplateId], [TemplateAlbomId], [path], [photo]) VALUES (2, 1, N'<div style="color:red;">hello</div>', N'gtry')
GO
INSERT [dbo].[PageTemplate] ([PageTemplateId], [TemplateAlbomId], [path], [photo]) VALUES (3, 1, N'<div style="color:blue;">yaeli</div>', N'fpgkh')
GO
INSERT [dbo].[PageTemplate] ([PageTemplateId], [TemplateAlbomId], [path], [photo]) VALUES (4, 1, N'<div class="progress">
  <div class="progress-bar" role="progressbar" aria-valuenow="70"
  aria-valuemin="0" aria-valuemax="100" style="width:70%">
    <span class="sr-only">70% Complete</span>
  </div>
</div>', N'444')
GO
INSERT [dbo].[PageTemplate] ([PageTemplateId], [TemplateAlbomId], [path], [photo]) VALUES (5, 1, N'<p class="bg-primary">This text is important.</p>', N'22')
GO
INSERT [dbo].[PageTemplate] ([PageTemplateId], [TemplateAlbomId], [path], [photo]) VALUES (6, 1, N'<div class="temlate1 circular"></div>', NULL)
GO
INSERT [dbo].[PageTemplate] ([PageTemplateId], [TemplateAlbomId], [path], [photo]) VALUES (7, 1, N'<div id="t1" style="color:blue;" (click)="pic($event)">yaeli</div>', NULL)
GO
SET IDENTITY_INSERT [dbo].[PageTemplate] OFF
GO
SET IDENTITY_INSERT [dbo].[photo] ON 
GO
INSERT [dbo].[photo] ([photoId], [userId], [path]) VALUES (1, 1, N'192.jpg')
GO
INSERT [dbo].[photo] ([photoId], [userId], [path]) VALUES (2, 1, N'207.jpg')
GO
INSERT [dbo].[photo] ([photoId], [userId], [path]) VALUES (3, 1, N'206.JPG')
GO
INSERT [dbo].[photo] ([photoId], [userId], [path]) VALUES (4, 1, N'image_351598.jpg')
GO
SET IDENTITY_INSERT [dbo].[photo] OFF
GO
SET IDENTITY_INSERT [dbo].[Sticker] ON 
GO
INSERT [dbo].[Sticker] ([StickerId], [path], [subject]) VALUES (1, N'localhost:61739/img/stickers/food/תפוח.png', 1)
GO
INSERT [dbo].[Sticker] ([StickerId], [path], [subject]) VALUES (2, N'localhost:61739/img/stickers/food/רימון.png', 1)
GO
INSERT [dbo].[Sticker] ([StickerId], [path], [subject]) VALUES (3, N'localhost:61739/img/stickers/food/עוגה אישית.png', 1)
GO
INSERT [dbo].[Sticker] ([StickerId], [path], [subject]) VALUES (4, N'localhost:61739/img/stickers/food/אננס.png', 1)
GO
INSERT [dbo].[Sticker] ([StickerId], [path], [subject]) VALUES (5, N'localhost:61739/img/stickers/letters/!.png', 2)
GO
INSERT [dbo].[Sticker] ([StickerId], [path], [subject]) VALUES (6, N'localhost:61739/img/stickers/letters/(.png', 2)
GO
INSERT [dbo].[Sticker] ([StickerId], [path], [subject]) VALUES (7, N'localhost:61739/img/stickers/letters/).png', 2)
GO
INSERT [dbo].[Sticker] ([StickerId], [path], [subject]) VALUES (8, N'localhost:61739/img/stickers/letters/''.png', 2)
GO
INSERT [dbo].[Sticker] ([StickerId], [path], [subject]) VALUES (9, N'localhost:61739/img/stickers/letters/''''.png', 2)
GO
INSERT [dbo].[Sticker] ([StickerId], [path], [subject]) VALUES (10, N'localhost:61739/img/stickers/letters/A man.png', 2)
GO
INSERT [dbo].[Sticker] ([StickerId], [path], [subject]) VALUES (11, N'localhost:61739/img/stickers/letters/A tropic.png', 2)
GO
INSERT [dbo].[Sticker] ([StickerId], [path], [subject]) VALUES (12, N'localhost:61739/img/stickers/letters/a.png', 2)
GO
SET IDENTITY_INSERT [dbo].[Sticker] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 
GO
INSERT [dbo].[Subjects] ([SubjectId], [Subject]) VALUES (1, N'food')
GO
INSERT [dbo].[Subjects] ([SubjectId], [Subject]) VALUES (2, N'letters')
GO
INSERT [dbo].[Subjects] ([SubjectId], [Subject]) VALUES (3, N'love')
GO
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[TemplateAlbom] ON 
GO
INSERT [dbo].[TemplateAlbom] ([TemplateAlbomId], [PageSizeheight], [PageSizewidth]) VALUES (1, 15, 20)
GO
INSERT [dbo].[TemplateAlbom] ([TemplateAlbomId], [PageSizeheight], [PageSizewidth]) VALUES (2, 20, 20)
GO
INSERT [dbo].[TemplateAlbom] ([TemplateAlbomId], [PageSizeheight], [PageSizewidth]) VALUES (3, 30, 40)
GO
INSERT [dbo].[TemplateAlbom] ([TemplateAlbomId], [PageSizeheight], [PageSizewidth]) VALUES (4, 30, 30)
GO
INSERT [dbo].[TemplateAlbom] ([TemplateAlbomId], [PageSizeheight], [PageSizewidth]) VALUES (5, 22, 30)
GO
INSERT [dbo].[TemplateAlbom] ([TemplateAlbomId], [PageSizeheight], [PageSizewidth]) VALUES (6, 30, 22)
GO
INSERT [dbo].[TemplateAlbom] ([TemplateAlbomId], [PageSizeheight], [PageSizewidth]) VALUES (7, 20, 20)
GO
INSERT [dbo].[TemplateAlbom] ([TemplateAlbomId], [PageSizeheight], [PageSizewidth]) VALUES (8, 20, 15)
GO
INSERT [dbo].[TemplateAlbom] ([TemplateAlbomId], [PageSizeheight], [PageSizewidth]) VALUES (9, 20, 29)
GO
SET IDENTITY_INSERT [dbo].[TemplateAlbom] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserId], [UserName], [UserPassword], [UserMail]) VALUES (1, N'yaeli', N'1234', N'y@gmail.com')
GO
INSERT [dbo].[User] ([UserId], [UserName], [UserPassword], [UserMail]) VALUES (2, N'chani', N'5678', N'ce7223@gmail.com')
GO
INSERT [dbo].[User] ([UserId], [UserName], [UserPassword], [UserMail]) VALUES (3, N'nechami', N'5555', N'njkhjkhjoi')
GO
INSERT [dbo].[User] ([UserId], [UserName], [UserPassword], [UserMail]) VALUES (4, N'efrat', N'1212', N'njkhjkhjoi')
GO
INSERT [dbo].[User] ([UserId], [UserName], [UserPassword], [UserMail]) VALUES (5, N'Tami', N'1111', N'oiop')
GO
INSERT [dbo].[User] ([UserId], [UserName], [UserPassword], [UserMail]) VALUES (6, N'ddd', N'4444', NULL)
GO
INSERT [dbo].[User] ([UserId], [UserName], [UserPassword], [UserMail]) VALUES (7, N'dasi', N'7777', NULL)
GO
INSERT [dbo].[User] ([UserId], [UserName], [UserPassword], [UserMail]) VALUES (8, N',nh', N',nh', NULL)
GO
INSERT [dbo].[User] ([UserId], [UserName], [UserPassword], [UserMail]) VALUES (9, N'שולמית', N'0543210', NULL)
GO
INSERT [dbo].[User] ([UserId], [UserName], [UserPassword], [UserMail]) VALUES (10, N'', N'', N'hggygi')
GO
INSERT [dbo].[User] ([UserId], [UserName], [UserPassword], [UserMail]) VALUES (11, N'yaeli', N'4566677', N'gkkhkijp')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Albom]  WITH CHECK ADD  CONSTRAINT [FK_Albom_TemplateAlbom] FOREIGN KEY([TamplateAlbomId])
REFERENCES [dbo].[TemplateAlbom] ([TemplateAlbomId])
GO
ALTER TABLE [dbo].[Albom] CHECK CONSTRAINT [FK_Albom_TemplateAlbom]
GO
ALTER TABLE [dbo].[Albom]  WITH CHECK ADD  CONSTRAINT [FK_Albom_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Albom] CHECK CONSTRAINT [FK_Albom_User]
GO
ALTER TABLE [dbo].[Background]  WITH CHECK ADD  CONSTRAINT [FK_Background_Subjects] FOREIGN KEY([subject])
REFERENCES [dbo].[Subjects] ([SubjectId])
GO
ALTER TABLE [dbo].[Background] CHECK CONSTRAINT [FK_Background_Subjects]
GO
ALTER TABLE [dbo].[Background]  WITH CHECK ADD  CONSTRAINT [FK_Background_TemplateAlbom] FOREIGN KEY([TemplateAlbom])
REFERENCES [dbo].[TemplateAlbom] ([TemplateAlbomId])
GO
ALTER TABLE [dbo].[Background] CHECK CONSTRAINT [FK_Background_TemplateAlbom]
GO
ALTER TABLE [dbo].[PageAlbom]  WITH CHECK ADD  CONSTRAINT [FK_PageAlbom_Albom] FOREIGN KEY([AlbomID])
REFERENCES [dbo].[Albom] ([AlbomId])
GO
ALTER TABLE [dbo].[PageAlbom] CHECK CONSTRAINT [FK_PageAlbom_Albom]
GO
ALTER TABLE [dbo].[PageTemplate]  WITH CHECK ADD  CONSTRAINT [FK_PageTemplate_TemplateAlbom] FOREIGN KEY([TemplateAlbomId])
REFERENCES [dbo].[TemplateAlbom] ([TemplateAlbomId])
GO
ALTER TABLE [dbo].[PageTemplate] CHECK CONSTRAINT [FK_PageTemplate_TemplateAlbom]
GO
ALTER TABLE [dbo].[photo]  WITH CHECK ADD  CONSTRAINT [FK_photo_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[photo] CHECK CONSTRAINT [FK_photo_User]
GO
ALTER TABLE [dbo].[Shape]  WITH CHECK ADD  CONSTRAINT [FK_Shape_Subjects] FOREIGN KEY([subject])
REFERENCES [dbo].[Subjects] ([SubjectId])
GO
ALTER TABLE [dbo].[Shape] CHECK CONSTRAINT [FK_Shape_Subjects]
GO
ALTER TABLE [dbo].[Sticker]  WITH CHECK ADD  CONSTRAINT [FK_Sticker_Subjects] FOREIGN KEY([subject])
REFERENCES [dbo].[Subjects] ([SubjectId])
GO
ALTER TABLE [dbo].[Sticker] CHECK CONSTRAINT [FK_Sticker_Subjects]
GO
USE [master]
GO
ALTER DATABASE [!picture] SET  READ_WRITE 
GO
